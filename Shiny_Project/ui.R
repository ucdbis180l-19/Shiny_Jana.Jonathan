
# ui.R
# Shiny Web Project 
# BIS 180L
# Jana and Jonathan

library(shiny)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Data"),
  
  # Some helpful information
  helpText(h3("This application creates a scatter plot to show the variation and dependence between four 
           features of the Rice data. Using this Shiny app, you can manipulate and 
           observe their dynamic relationship based on 
           region.")),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
     selectInput("region",
                  label = "Choose a region to display:",
                  choices = c("Europe",
                    "E Asia",
                    "S Asia",
                    "Pacific", "Mid East", "America", "SE Asia",
                    "Africa", "C Asia")),
      
        radioButtons("pheno1",
                   "Characteristic 1 on x-axis",
                   c("Seed_length",
                     "Seed_width")), 
       radioButtons("pheno2",
                   "Characteristic 2 on y-axis",
                   c("Seed_volume",
                     "Seed_surface_area"))
          
      ),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput(outputId = "plottedData")
    )
  )
))
