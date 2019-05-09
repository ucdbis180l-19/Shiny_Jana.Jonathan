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
  helpText("This application creates a boxplot to show difference between",
           "iris species.  Please use the radio box below to choose a trait",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("region", #the input variable that the value will go into
                   "Choose a region to display:",
                   c("Europe",
                     "E Asia",
                     "S Asia",
                     "Pacific", "Mid East", "America", "SE Asia",
                     "Africa", "C Asia")),
      radioButtons("pheno1", c("Blast Resistance")), 
      radioButtons("pheno2", c("Seed length"))
          
      )),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("plottedData")
    )
  )
)
