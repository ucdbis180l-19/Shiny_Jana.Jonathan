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
  output$plottedData <- renderPlot({
    pheno.plot <- data.pheno.mds %>%
      filter(Region == input$region) %>%
      ggplot(
        aes_string(
          x = input$pheno1,
          y = input$pheno2,
          fill = Region
        )
      )
    pheno.plot <- pheno.plot + geom_dotplot()
  })
  
})
