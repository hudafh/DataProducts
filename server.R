
# server.r
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
        
        set.seed(789)
        model1 <- lm(mpg ~ hp, data = mtcars)
        model2 <- lm(mpg ~ hp + cyl + drat + carb, data = mtcars)
        
        model1pred <- reactive({
        
                hpInput <- input$sliderHp
                predict(model1, newdata = data.frame(hp=hpInput))
        })
        
        model2pred <- reactive({
               
                hpInput <- input$sliderHp
                cylInput <- input$sliderCyl
                dratInput <- input$sliderDrat
                carbInput <- input$sliderCarb
                predict(model2, newdata = data.frame(hp = hpInput, cyl = cylInput, drat = dratInput, carb = carbInput))
                
        })
        
        output$plot1 <- renderPlot({
                
                hpInput <- input$sliderHp
                
                plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", 
                     ylab = "Miles Per Gallon", bty = "n", pch = 16,
                     xlim = c(50, 350), ylim = c(10, 35))
                if(input$showModel1){
                        abline(model1, col = "red", lwd = 2)
                }
                if(input$showModel2){
                        
                        abline(model2, col = "blue", lwd = 2)
                }
                
                legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
                       col = c("red", "blue"), bty = "n", cex = 1.2)
                points(hpInput, model1pred(), col = "red", pch = 16, cex = 2)
                points(hpInput, model2pred(), col = "blue", pch = 16, cex = 2)
        })
        
        output$pred1 <- renderText({
                model1pred()
        })
        
        output$pred2 <- renderText({
                model2pred()
        })
})
