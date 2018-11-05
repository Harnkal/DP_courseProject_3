library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualize Many Models 2.0"),
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
            fluidPage(
                h3("Introduction"),
                p("This application creates linear models based on the selected points from the trees dataset."),
                h3("Plot area"),
                p("You can use the plot area to select points by clicking and draging the cursor, by selecting 2 or more points the application will fit a model based on this points."),
                h3("Slope and Intercept"),
                p("As long as you have selected 2 or more points in the graph, the side bar fields ", strong("Slope"), " and ", strong("Intercept"), "will respectively show the inclination of the linear fit and at witch point it is in Y when X equals 0."),
                h3("Intervals"),
                p("By toggling the checkboxs in this section you can show or hide the ", strong("confidence"), " and ", strong("prediction"), " intervals in the graph. It is very interesting to observe how selecting fewer observations can make the fit less trustable.")
            )
        })
    )
))