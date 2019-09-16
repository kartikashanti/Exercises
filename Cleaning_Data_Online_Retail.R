# Title       : Cleaning_Data_Online_Retail.R 
# Description : This is an online retail script and its cleaning process.
# Objective   : To sample 10k data and clean them into a ready to be analyzed format. 
# Data source : https://archive.ics.uci.edu/ml/datasets/online+retail 

# This is a transnational data set which contains all the transactions occurring between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.The company mainly sells unique all-occasion gifts. Many customers of the company are wholesalers.

# load library
library(tidyverse)
library(lubridate)
library(DataExplorer)

# load data
onlineretail <- read.csv("dataset/online_retail/OnlineRetail.csv",stringsAsFactors = F)

# preview first 6 rows of data
head(onlineretail)

# preview last 6 rows of data
tail(onlineretail)

# summary of the data 
summary(onlineretail)

plot_missing(onlineretail)

# sampling data 
ol_sample <- onlineretail[sample(1:nrow(onlineretail), size=10000),]
summary(ol_sample)

# We are going to clean ol_sample data. 

# checking variable data
str(ol_sample)
plot_str(ol_sample)

# From the output, are the variables in the right format? 

# Check out the InvoiceDate, it is in character type format, it should be in Date datatype. You have to convert it to date friendly format. Find out the documentation of lubridate package on Help! 

# Convert the data type for InvoiceDate variable from chr to Date (POSIXct)
ol_sample$InvoiceDate <- dmy_hm(ol_sample$InvoiceDate)

# Are there any missing data? 
plot_missing(ol_sample)

# Customer ID have 25% missing value. What are you going to do with that? Please ask your data owner! (in this case, we think that those empty data because the customer has no customer ID or bought as a guest)

# if you want to drop, simply use this command: 
ol_sample_drop <- ol_sample[!is.na(ol_sample$CustomerID),]

# if you want to keep rows with empty customerID, simply use this command, replace with unique value that did not yet input. 
max_CustID <- max(ol_sample[!is.na(ol_sample$CustomerID),]$CustomerID)
ol_sample_imput <- ol_sample
ol_sample_imput$CustomerID[is.na(ol_sample_imput$CustomerID)] <- sample(max_CustID+10000:max_CustID+10000+length(ol_sample), size=sum(is.na(ol_sample_imput$CustomerID)), replace=F)
length(ol_sample[is.na(ol_sample$CustomerID),])

# check missing data again 
plot_missing(ol_sample_drop)
plot_missing(ol_sample_imput)

# let's assume we use the drop data (only complete customer id). We would like to change contry column from United Kingdom into Inggris for example, we can use gsub.
plot_bar(ol_sample_drop$Country)

ol_sample_drop$Country <- gsub('United Kingdom', 'Inggris', ol_sample_drop$Country)

# Question: 
# Can you change the name of Country using gsub? from:
# Germany to Jerman 
# Spain to Spanyol
# France to Prancis
# Switzerland to Swiss 
