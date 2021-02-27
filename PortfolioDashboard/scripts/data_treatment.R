dataPositions <- read.csv("data/Positions.csv")

dataTransactions <- read.csv("data/Transactions.csv")
dataTransactions$Date <- as.Date(dataTransactions$Date, "%m/%d/%Y")

#informacion <- reactive({
Transactions <- read.csv('data/Transactions.csv') %>% mutate(Total=as.numeric(Total))
#  Transactions
#})

#typeof(Transactions)
Transactions <- as.data.frame(Transactions)
#firstsheet <-informacion()

#myDf$Total  

#str(Transactions)
#is.na(Transactions$Total)

Total_Cost <- Transactions %>%
  summarise( res = sum(Total))

Shared_Owned <- Transactions %>%
  summarise( res1 = sum(Quantity))


Average_Shared_Cost <- round(Total_Cost/Shared_Owned,2)


Positions <- read.csv('data/Positions.csv') #%>% mutate(Total=as.numeric(Total))
str(Positions)
Gains <- Positions %>%
  summarise( res3 = sum(Gain...1))

Account_value <- round(sum(Total_Cost,Gains),2)

