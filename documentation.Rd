\name{MPG prediction}
\alias{MPG prediction}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
        MPG prediction documentation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
              In this shiny app 2 models are compared and predictions are made based on input from the user.
      
              Model 1 models MPG given the horsepower. It is the red line on the plot.
              
              Model 2 models MPG given the horsepower, cylinders, drat, and carburetors. It is the blue line on the plot.
        
              Prediction Input is done through the sliders on the left pane and clicking "Submit"
}
\usage{
        
       
        Use sliders for prediction input and click the submit button
}
%- maybe also 'usage' for other objects documented here.

\details{
%%  ~~ If necessary, more details than the description above ~~


        There are 2 models using data from the mtcars dataset 

        Model 1: MPG ~ hp . Only takes input from horsepower slider
        
        Model 2: MPG ~ hp + cyl+drat+carb . Takes input from all of the sliders
}


\author{
%%  Hugo Barros
}


