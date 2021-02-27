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


#Total_Cost <- formatC(Total_Cost, format="f", digits=2, big.mark=",")


Shared_Owned <- Transactions %>%
  summarise( res1 = sum(Quantity))



Positions <- read.csv('data/Positions.csv') #%>% mutate(Total=as.numeric(Total))
str(Positions)
Gains <- Positions %>%
  summarise( res3 = sum(Gain...1))

Account_value <- round(sum(Total_Cost,Gains),2) 
#Account_value <- formatC(Account_value, format="f", digits=2, big.mark=",")


Total_Cost <- format(round(as.numeric(Total_Cost), 2), nsmall=1, big.mark=",")
Account_value <- format(round(as.numeric(Account_value), 2), nsmall=1, big.mark=",")
Gains <- format(round(as.numeric(Gains), 1), nsmall=1, big.mark=",")
