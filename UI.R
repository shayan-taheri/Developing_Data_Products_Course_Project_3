# Author: Shayan (Sean) Taheri
# Developing Data Products -- Project 3: User-Interface Version of Shiny Web Application.
# Click on the "Run App" button to start the application.

# Loading the "shiny" library.
library(shiny)

# Define User-Interface for Application with the Function of Drawing a Histogram:
shinyUI(fluidPage(
  
  titlePanel("Calculation of the Cost of Gasoline Over Certain Distance using Fetched Data from 'mtcars' dataset"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Provide the distance you have traveled:"),
      numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 100000),
      numericInput('cost', 'Gasoline Price ($ per gallon):', 2.523),
      checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
      checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
    ),
    mainPanel(
      dataTableOutput('table')
    )
  )
))