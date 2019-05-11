# ui.R
# Shiny Web Project 
# BIS 180L
# Jana and Jonathan

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Data"),
  
  # Some helpful information
  helpText("This application creates a scatter plot to show the variation and dependence between three 
           characteristics of the Rice data. Using this Shiny app, you can manipulate and 
           observe the relationship of some of the characteristics of the Rice plants based on 
           region."),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
     selectInput("select",
                 "region",
                  label = "Choose a region to display:",
                  choices = c("Europe",
                    "E Asia",
                    "S Asia",
                    "Pacific", "Mid East", "America", "SE Asia",
                    "Africa", "C Asia")),
      
      # radioButtons("region", #the input variable that the value will go into
      # "Choose a region to display:",
      #  c("Europe",
      #   "E Asia",
      #   "S Asia",
      #   "Pacific", "Mid East", "America", "SE Asia",
      #   "Africa", "C Asia")),
      # 
        radioButtons("pheno1",
                   "Seed length vs width dependent on region",
                   c("Seed_length",
                     "Seed_width")), 
       radioButtons("pheno2",
                   "Seed volume vs sruface area dependent on region",
                   c("Seed_volume",
                     "Seed_surface_area"))
          
      ),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("plottedData")
    )
  )
))
