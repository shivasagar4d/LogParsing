setwd("E:/D2252017/Project-RAppV4/Project-RAppV4")
library(dplyr)
library(tibble)
Book1 = read.csv('Book1.csv')
Book2 = read.csv('Book2.csv')
Book3 = read.csv('Book3.csv')

colnames(Book2)[which(names(Book2) == "Keyword_2")] <- "keyword_2"
colnames(Book3)[which(names(Book3) == "Keyword_2")] <- "keyword_2"

# add rownames as a column in each data.frame and bind rows
df<- bind_rows(Book1 %>% add_rownames(), 
               Book2 %>% add_rownames(),
               Book3 %>% add_rownames()) 

colnames(df)[which(names(df) == "rowname")] <- "Dataset"
df[1:13, 1] = "Book1"
df[14:21, 1] = "Book2"
df[22:31, 1] = "Book3"
