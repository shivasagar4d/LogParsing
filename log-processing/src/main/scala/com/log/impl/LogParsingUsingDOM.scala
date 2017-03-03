package com.log.impl

import org.slf4j.LoggerFactory
import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import jodd.util.URLDecoder
import scala.xml.Elem
import scala.xml.XML
import org.xml.sax.InputSource
import org.w3c.dom.NodeList
import javax.xml.parsers.DocumentBuilderFactory
import java.io.StringReader
import scala.collection.mutable.Map
import scala.collection.mutable.Seq
import scala.xml.Document

object LogParsingUsingDOM {
  
  def main(args : Array[String]){
    
    
    //logger instance 
    val logger = LoggerFactory.getLogger(this.getClass.toString())
    
    if (args.length < 5) {
      logger.error("Invalid Number of input arguments! Expected 5 but found " + args.length)
      sys.exit(1)
    }
    
    val inputFileLocation = args(0)
    val inputXmlHeader = args(1)
    val outputLocation = args(2)
    val inputFileDelimiter = args(3)
    val outputFileDelimiter = args(4)
    var tagMap:Map[String,String] = null
    
    val conf = new SparkConf().setAppName("LogProcessing")
    val sc = new SparkContext(conf)
    
    //read the xml header file
    val xmlHeader = sc.textFile(inputXmlHeader).take(1).mkString
    
    //recursive function for pouplating the tag values in a map
    def parseChildNodes(nodes:NodeList){
           
           for(nodelist <- 0 to nodes.getLength-1){
             if(nodes.item(nodelist).getNodeName.equalsIgnoreCase("#text")){
               logger.info(nodes.item(nodelist).getParentNode.getNodeName+" "+nodes.item(nodelist).getNodeValue)
               tagMap+= (nodes.item(nodelist).getParentNode.getNodeName).toLowerCase() -> nodes.item(nodelist).getNodeValue
             }
             parseChildNodes(nodes.item(nodelist).getChildNodes)
           }
         }
    
    //functions for rdd processing
    def parseLog(inputLine:String):String = {
        
    val lineArray = inputLine.split("\\"+inputFileDelimiter)
      val urlEncodedText = lineArray(4)
      
      val decodedTExt = URLDecoder.decode(urlEncodedText,"UTF-8")
      val decodedTextRemovedHeader = decodedTExt.replace(decodedTExt.substring(0, decodedTExt.indexOf("?>")+2), "")
            
      //code using dom parser
      val dbFactory = DocumentBuilderFactory.newInstance();
         val dBuilder = dbFactory.newDocumentBuilder();
         var xmlParseddata:org.w3c.dom.Document = null
         try{
         xmlParseddata = dBuilder.parse(new InputSource(new StringReader(decodedTextRemovedHeader)));
         }catch {
           case t: Exception => logger.info("exception in loading the xml data")
            return inputLine+inputFileDelimiter+"parsing failed.error message:"+t.getMessage+inputFileDelimiter+"BADRECTRUE"
         }
      
         val rootTagName = xmlParseddata.getElementsByTagName(xmlParseddata.getDocumentElement().getNodeName())
      
     
      var returnResult = lineArray(0)+outputFileDelimiter+lineArray(1)+outputFileDelimiter+lineArray(2)+outputFileDelimiter+lineArray(3)+outputFileDelimiter
      
      //adding the root tag name
      returnResult = returnResult+rootTagName.item(0).getNodeName+outputFileDelimiter
      
     
      //do recursion over the xml data using the DOM parser functions
      val childNodes = rootTagName.item(0).getChildNodes
      tagMap = Map()
      parseChildNodes(childNodes)
      
      //iterate over the header columns and append the values to the output file
      val xmlHeaderArray = xmlHeader.toLowerCase().split("\\;")
      var outputList = Seq[String]()
      for(headerValues <- xmlHeaderArray){

    	  if(!tagMap.contains(headerValues)){
    		  outputList = outputList :+ "none"
    	  }
    	  else{
    		  outputList = outputList :+ tagMap(headerValues)
    	  }
      }
      
      return returnResult+outputList.mkString(outputFileDelimiter)
      }
    
    
    //read the input file
    val inputFile = sc.textFile(inputFileLocation)
    
    val processedRdd = inputFile.map(parseLog)
    processedRdd.persist()
   //filter the good and bad record
    val badRecords = processedRdd.filter { x => x.endsWith("BADRECTRUE")}
   
    val outputRdd = processedRdd.filter { x => !x.endsWith("BADRECTRUE")}
    
    badRecords.saveAsTextFile(outputLocation+"/badrecords")
    outputRdd.saveAsTextFile(outputLocation+"/output")
    
    processedRdd.unpersist(true)
  }
  
}