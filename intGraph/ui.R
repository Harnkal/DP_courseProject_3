library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualize Many Models"),
    sidebarLayout(
        sidebarPanel(
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut"),
            h3("95% Confidence Intervals"),
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
))