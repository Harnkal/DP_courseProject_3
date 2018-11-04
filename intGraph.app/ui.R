library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualize Many Models"),
    tabsetPanel(type = "tabs", 
        tabPanel("Application", {
            sidebarLayout(
                sidebarPanel(
                    h3("Slope"),
                    textOutput("slopeOut"),
                    h3("Intercept"),
                    textOutput("intOut"),
                    h3("Intervals"),
                    checkboxInput("showCI", "Show/hide confidence interval",
                                  value = TRUE),
                    checkboxInput("showPI", "Show/hide prediction interval",
                                  value = TRUE)
                ),
                mainPanel(
                    plotOutput("plot1", brush = brushOpts(
                        id = "brush1"
                    ))
                )
            )
        }),
        tabPanel("Documentation", {
            
        })
    )
))