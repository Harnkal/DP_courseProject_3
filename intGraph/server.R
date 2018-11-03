library(shiny)

shinyServer(function(input, output) {
    
    model <- reactive({
        brushed_data <- brushedPoints(trees, input$brush1, 
                                      xvar = "Girth", yvar = "Volume")
        if(nrow(brushed_data) < 2) {
            return(NULL)
        }
        lm(Volume ~ Girth, data = brushed_data)
    })
    
    ND <- data.frame(Girth = trees$Girth)
    
    CI <- reactive({
        mod <- model()
        predict(mod, newdata = ND, interval = "confidence")
        })
    
    PI <- reactive({
        mod <- model()
        predict(mod, newdata = ND, interval = "prediction")
    })
    
    output$slopeOut <- renderText({
        if(is.null(model())) {
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    output$intOut <- renderText({
        if(is.null(model())) {
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    output$plot1 <- renderPlot({
        plot(trees$Girth, trees$Volume, xlab = "Girth",
             ylab = "Volume", main = "Tree Measurements",
             cex = 1.5, pch = 16, bty = "n")
        if(!is.null(model())) {
            abline(model(), col = "blue", lwd = 2)
            if(input$showCI) {
                lines(x = ND$Girth, y = CI()[,2], col = "purple", lwd = 2)
                lines(x = ND$Girth, y = CI()[,3], col = "purple", lwd = 2)
            }
            if(input$showPI) {
                lines(x = ND$Girth, y = PI()[,2], col = "red", lwd = 2)
                lines(x = ND$Girth, y = PI()[,3], col = "red", lwd = 2)
            }
        }
    })
})