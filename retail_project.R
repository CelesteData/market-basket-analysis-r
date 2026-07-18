#load library
library(arules)

#load the retail data into a sparse matrix
retail <- read.csv("online_retail_II.csv", sep = ",")
summary(retail)

#loading dplyr to filter the data
library(dplyr)

#checking all the column names
colnames(retail)

#creating clean data frame
retail_clean <- retail%>%
  filter(Country == "United Kingdom") %>% #Filtering for United Kingdom transactions
  filter(Quantity > 0 & Price > 0) %>% #Filtering for positive quantity and price
  filter(!grepl("^C", Invoice))%>% #Filtering out Invoices beginning with "C"
  distinct()%>% #Removing duplicate rows
  na.omit() #Removing rows with missing values

#aggregating the data by invoice and converting the data into a transactions object
transactions <- as(split(retail_clean$Description, retail_clean$Invoice), "transactions")

#looking at the summary of the new transactions object
summary(transactions)

#using the apriori() function to generate association rules
retail_rules <- apriori(transactions, parameter = list(support = 0.002,
                                                    confidence = 0.3,
                                                    minlen = 2))

#viewing how many retail_rules there are
retail_rules

#summarizing the association rules
summary(retail_rules)

#using the apriori() function to generate fewer association rules
retail_rules2 <- apriori(transactions, parameter = list(support = 0.01,
                                                       confidence = 0.5,
                                                       minlen = 2))

#using the apriori() function to generate fewer association rules
retail_rules3 <- apriori(transactions, parameter = list(support = 0.05,
                                                        confidence = 0.5,
                                                        minlen = 2))

#moving forward with retail_rules2 because a support value of 0.05 did not
#result in any rules.

summary(retail_rules2)

#sorting the rules largest to smallest by lift
top_10_rules <- head(sort(retail_rules2, by = "lift"), 10)

#inspecting the top 10 rules
inspect(top_10_rules)

#saving top rules as a data frame
top_10_rules_df <- as(top_10_rules, "data.frame")

#removing index numbers to produce a cleaner list of rules
rownames(top_10_rules_df) <- NULL

#printing the top ten rules data frame
print(top_10_rules_df)

#writing the top 10 rules into a pdf
#installing package/library to convert to pdf
install.packages("gridExtra")
library(gridExtra)

#saving top ten rules as pdf
#setting the pdf function
pdf("Top_10_Rules.pdf", width=12, height=6)

#creating the data frame in the pdf
grid.table(top_10_rules_df)

#turning off pdf and saving file
dev.off()
