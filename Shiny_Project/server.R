# server.R
# Shiny Web Project
# BIS 180L
# Jana and Jonathan
# Thing's we can compare x = ancesteral 


library(shiny)
library(ggplot2)
library(tidyverse)

data.pheno.mds <- read_csv("data.pheno.mds.csv", col_names = TRUE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$mainGraph <- renderPlot({ # main graph output == plottedData
    pheno.data.filtered <- filter(data.pheno.mds, 'Region' == input$regions)
    pheno.plot <- ggplot(data = pheno.data.filtered, 
                         aes_string(
                           x = `Seed length`, # First phenotype selected
                           y = `Seed width` # Second phenotype selected
        )
      )
    pheno.plot + geom_point()
  })
  
})
