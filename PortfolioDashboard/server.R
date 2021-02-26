shinyServer(function(input, output) {
    output$moncher <- renderText({
        'Moncher!!!!'
    })
    
    output$lol <- renderText({
        'Lol!!!!'
    })
    
    output$bar <- renderPlot({
        ggplot(iris, aes(x = Sepal.Width)) + geom_histogram()
    })
    
    output$table <- renderDataTable({
        iris
    })
    
    
    
    output$plot <- renderPlotly({
        
        
        AMD <- getSymbols(input$Id085,
                          from = "2016/12/31",
                          to = "2018/12/31",
                          periodicity = "daily",
                          auto.assign = FALSE)
        index(AMD)
        
        df <- data.frame(Date=index(AMD), coredata(AMD))
        
        names(df) <- c('Date', 'Open', 'High', 'Low', 'Close', 'Volume', 'Adjusted')
        
        fig <- df %>% plot_ly(x = ~Date, type="candlestick",
                              open = ~Open, close = ~Close,
                              high = ~High, low = ~Low)
        
        fig <- fig %>% layout(xaxis = list(rangeslider = list(visible = F)))
        
        fig
    })
    
    output$table <- renderDataTable({
        ts <- read.csv("~/DataScience/EAE/Visualization2/Clase1/StockTest1/data/Transactions.csv")
        
        ts <- ts %>% dplyr::filter(Security == input$Id085)
        
        ts
    })
    
    output$stockName <- renderText({
        'Coca-Cola Co.'
    })
    output$stockId <- renderText({
        '(KO)'
    })
    output$stockPrice <- renderUI({
        tags$div(
            "50",
            #tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/3/36/Up_green_arrow.png", width = "30px", height = "30px")
            tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/b/b0/Down_red_arrow.png", width = "30px", height = "30px")
        )
    })
    output$stockPrices <- renderUI({
        AAPL <- getSymbols("AAPL",
                           from = "2016/12/31",
                           to = "2018/12/31",
                           periodicity = "daily",
                           auto.assign = FALSE)
        
        names(AAPL)[names(AAPL) == "AAPL.Open"] <- "Open"
        names(AAPL)[names(AAPL) == "AAPL.Close"] <- "Close"
        names(AAPL)[names(AAPL) == "AAPL.High"] <- "High"
        names(AAPL)[names(AAPL) == "AAPL.Low"] <- "Low"
        names(AAPL)[names(AAPL) == "AAPL.Volume"] <- "Volume"
        names(AAPL)[names(AAPL) == "AAPL.Adjusted"] <- "Adjusted"
        
        #AAPL[1,c("Open","Close","High", "Low", "Adjusted")]
        
        tags$table(
            tags$tr(
                tags$th("Open"),
                tags$th("Close"),
                tags$th("High"),
                tags$th("Low")
            ),
            tags$tr(
                tags$td(AAPL[1, "Open"]),
                tags$td(AAPL[1, "Close"]),
                tags$td(AAPL[1, "High"]),
                tags$td(AAPL[1, "Low"])
            )
        )
    })
    
    output$pTest <- renderUI({
        tags$table(
            tags$tr(
                tags$th("Shares Owned:"),
                tags$td("340")
            ),
            tags$tr(
                tags$th("Total Cost:"),
                tags$td("1230$")
            ),
            tags$tr(
                tags$th("Total Gain:"),
                tags$td("500$")
            ),
            tags$tr(
                tags$th("Average Share Cost:"),
                tags$td("60$")
            )
        )
    })
})