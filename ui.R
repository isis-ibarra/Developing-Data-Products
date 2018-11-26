# Title: Diamond price predictor
# Author: Isis Ibarra Garcia
# Date: November 25th, 2018
# Output: ui.R file for the shiny app 
#
# Developing Data Products
# Peer-graded Assignment: Shiny Application and Reproducible Pitch
#
# Overview: User-interface definition for the shiny web application
#           in order to predict a diamond's price. 

# 1. Load libraries 
library(shiny)
library(ggplot2)

# 2. Define user interface
shinyUI(fluidPage(
  
  # 2.1 Defice application title
  titlePanel("Diamond price predictor"),
  
  # 2.2 Define sidebar
  sidebarLayout(
    sidebarPanel(
      helpText("Please select a label from the following diamond characteristics to predict its price."),
      
      # Filter 1: Carats
      numericInput("car", label = h5("Carats"), value = round(mean(diamonds$carat), digits = 1), 
                                                min = round(min(diamonds$carat), digits = 0), 
                                                max = round(max(diamonds$carat), digits = 0), 
                                                step = 0.1
                   ),
      
      # Filter 2: Cut
      # levels(diamonds$cut)
      # "Fair"  "Good"  "Very Good" " Premium"   "Ideal" 
      selectInput("cut", label = h5("Cut"), 
                         choices = list("Select" = "*", 
                                        "Fair" = "Fair", 
                                        "Good" = "Good",
                                        "Very Good" = "Very Good", 
                                        "Premium" = "Premium",
                                        "Ideal" = "Ideal"
                                        )
                  ),
      
      # Filter 3: Color
      # levels(diamonds$color)
      # "D" "E" "F" "G" "H" "I" "J"
      selectInput("col", label = h5("Color"), 
                         choices = list("Select" = "*", 
                                        "D" = "D", 
                                        "E" = "E",
                                        "F" = "F", 
                                        "G" ="G",
                                        "H" = "H", 
                                        "I" = "I",
                                        "J" = "J"
                                        )
                  ),
      
      # Filter 4: Clarity
      # levels(diamonds$clarity)
      # "I1"   "SI2"  "SI1"  "VS2"  "VS1"  "VVS2" "VVS1" "IF"
      selectInput("clar", label = h5("Clarity"), 
                          choices = list("Select" = "*", 
                                         "I1" = "I1",
                                         "SI2" = "SI2",
                                         "SI1" = "SI1",
                                         "VS2" = "VS2",
                                         "VS1" = "VS1",
                                         "VVS2" = "VVS2",
                                         "VVS1" = "VVS1", 
                                         "IF" = "IF"
                                         )
                  )
    ),
    
    # 3. Show a plot 
    mainPanel(
      plotOutput("distPlot"),
      h4(textOutput("result")
         )
      )
    )
  ))