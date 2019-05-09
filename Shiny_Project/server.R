# server.R
# Shiny Web Project
# BIS 180L
# Jana and Jonathan
# Thing's we can compare x = ancesteral 


library(shiny)
library(ggplot2)
library(tidyverse)

data.pheno.mds <- read_csv("~/Shiny_Jana.Jonathan/Shiny_Project/data.pheno.mds.csv", col_names = TRUE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plottedData <- renderPlot({ # main graph output == plottedData
    pheno.plot <- data.pheno.mds %>%
      if(input$region != "All") { # checks for region specificity
        filter(Region == input$region) # filters data by region input
        } %>%
      ggplot(
        aes_string(
          x = input$pheno1, # First phenotype selected
          y = input$pheno2, # Second phenotype selected
          fill = Region # region = fill color
        )
      )
    pheno.plot <- pheno.plot + geom_dotplot()
  })
  
})
