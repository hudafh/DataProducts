#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict MPG from Horsepower & from HorsePower/Cyl/drat/carb"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderHp", "What is the Horsepower of the car?", 50, 350, value = 200),
                        sliderInput("sliderCyl", "Number of cylinders of the car?", 4, 8, value = 4),
                        sliderInput("sliderDrat", "What is the DRAT of the car?", 2.76, 4.93, value = 2.76),
                        sliderInput("sliderCarb", "Number of carburetors of the car?", 1, 8, value = 1),
                        checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
                        checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
                        submitButton("Submit")
                ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted MPG from Model 1:"),
                        textOutput("pred1"),
                        h3("Predicted MPG from Model 2:"),
                        textOutput("pred2"),
                        h3(""),
                        h4("Data: mtcars"),
                        
                        h5("The graph shows 2 models: The red slope is a model of the MPG given the HorsePower. The Blue slope is a model of the MPG given
                           all of the predictors on the left panel"),
                        
                        h5("The colored points are the predicted MPGs for a set of given values. The red point is MPG for the selected hp, and the blue point
                           is MPG for the selected hp, cyl, drat,carb")
                )
        )
))