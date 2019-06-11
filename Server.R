# Author: Shayan (Sean) Taheri
# Developing Data Products -- Project 3: Server Version of Shiny Web Application.
# Click on the "Run App" button to start the application.

# Loading the "shiny" library.
library(shiny)
library(datasets)
library(dplyr)

# Define Server Version for Application with the Function of Drawing a Histogram:
shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    car_data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      CostofGasoline = input$dis/mpg*input$cost,
                      Cylinders = cyl, Transmission = am)
    car_data <- filter(car_data, Cylinders %in% input$cyl, 
                   Transmission %in% input$am)
    car_data <- mutate(car_data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    car_data <- arrange(car_data, CostofGasoline)
    car_data
  }, options = list(lengthMenu = c(8, 16, 40), pageLength = 40))
})