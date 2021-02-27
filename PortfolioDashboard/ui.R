shinyUI(dashboardPage(
    dashboardHeader(title = "RobinGood"),
    dashboardSidebar(
        sidebarMenu(
        menuItem('Inicio', tabName = 'intro', icon = icon('home')),
        menuItem(
            'Portafolio',
            tabName = 'info',
            icon = icon('chart-line')
        ),
        menuItem(
            'Info por Accion',
            tabName = 'stock',
            icon = icon('chart-bar')
        ),
        menuItem(
            'contáctanos',
            tabName = 'about',
            icon = icon('question')
        )
    )),
    dashboardBody(tabItems(
        tabItem(tabName = 'intro',
                includeCSS('www/html/css/style.css'),
                includeHTML('www/html/intro.html')
                
        ),
        tabItem(tabName = 'info',
                fluidRow(column(
                    4,
                    fluidRow(
                        column(
                            12,
                            infoBox(
                                "Account Value",
                                paste0("$", '148,522'),
                                icon = icon('globe'),
                                width = 10,
                                color = 'olive',
                                fill = TRUE
                            )
                        ),
                        column(
                            12,
                            infoBox(
                                "Total Cost",
                                paste0("$", '122,876'),
                                icon = icon('wallet'),
                                width = 10,
                                color = 'blue',
                                fill = TRUE
                            )
                        ),
                        column(
                            12,
                            infoBox(
                                "Gains",
                                paste0("$", "25,646"),
                                icon = icon('money-bill'),
                                width = 10,
                                color = 'green',
                                fill = TRUE
                            )
                        ),
                        column(
                            12,
                            infoBox(
                                "Shared Owned",
                                '1,341',
                                icon = icon('list-alt'),
                                width = 10,
                                color = 'navy',
                                fill = TRUE
                            )
                        )
                    )
                ),
                column(
                    8,
                    box(
                        solidHeader = TRUE,
                        width = 12 ,
                        collapsible = FALSE,
                        collapsed = FALSE,
                        tabBox(
                            id = 'tabset1',
                            width = 12,
                            tabPanel('Distribution',h4 ("Quantity Shares acquired by the Company",align = "center", style ="font-weight:bold"), plotlyOutput("distributionPlot")),
                            tabPanel('Performance', h4 ("Performance by Company", align = "center", style ="font-weight:bold"), plotlyOutput("performancePlot"))
                        )
                    )
                ))),
        tabItem(tabName = 'stock',
                includeCSS('www/html/css/style.css'),
                fluidRow(column(
                    4,
                    box(
                        status = "primary",
                        width = 13,
                        pickerInput(
                            inputId = "stockPicker",
                            label = "Lista de Titulos",
                            choices = unique(dataP$Tickers),
                            options = list(size = 5)
                        ),
                    ),
                    box(
                        title = 'Stock Information',
                        status = "warning",
                        width = 13,
                        textOutput('stockName'),
                        textOutput('stockId'),
                        htmlOutput('stockPrice'),
                        br(),
                        htmlOutput('stockPrices')
                    ),
                    box(
                        title = 'Portfolio Information',
                        status = "success",
                        width = 13,
                        htmlOutput('portfolioStockDataHtml')
                    )
                ),
                column(
                    8,
                    box(
                        title = "Market Price",
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE,
                        width = 20,
                        fluidRow(column(2),
                                 column(
                                     8,
                                     dateRangeInput(
                                         "dates",
                                         "Rango de Fechas",
                                         min('2020-01-01'),
                                         max('2022-01-01')
                                     )
                                 ),
                                 column(2)),
                        plotlyOutput("stockMarketPlot", height = 250)
                    ),
                    box(
                        title = "Transactions",
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE,
                        width = 20,
                        dataTableOutput("stockTransactionsTable")
                    ))
                ))
    ))
))