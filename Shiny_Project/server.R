
# server.R
# Shiny Web Project
# BIS 180L
# Jana and Jonathan
# Thing's we can compare x = ancesteral 

library(rsconnect)
library(shiny)
library(ggplot2)
library(tidyverse)

data.pheno.mds <- read_csv("data.pheno.mds.csv", col_names = TRUE)


# Define server logic required to draw a plot
shinyServer(function(input, output) {
  output$plottedData <- renderPlot({ # main graph output == plottedData
    pheno.data.filtered <- data.pheno.mds %>% filter(Region == input$region)
    pheno.plot <- ggplot(data = pheno.data.filtered, 
                         aes_string(
                           x = input$pheno1, # First phenotype selected
                           y = input$pheno2, # Second phenotype selected
                           size = I(3)
            
                        
        )
      )
    pheno.plot + geom_point(color = "firebrick4")
  })
  
})
