# Author: Shayan (Sean) Taheri
# Developing Data Products -- Project 3: User-Interface Version of Shiny Web Application.
# Click on the "Run App" button to start the application.

# Loading the "shiny" library.
library(shiny)
library(knitr)
# Define User-Interface for Application with the Function of Drawing a Histogram:
shinyUI(fluidPage(
  
  titlePanel("Gasoline Cost Calculator -- Author: Shayan (Sean) Taheri"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Provide the Distance You Have Traveled:"),
      numericInput('dis', 'Distance (Miles):', 50, min = 1, max = 100000),
      numericInput('cost', 'Gasoline Price (Dollar Per Gallon):', 2.523),
      checkboxGroupInput('cyl', 'Number of Cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
      checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
    ),
    mainPanel(
      dataTableOutput('table')
    )
  )
))