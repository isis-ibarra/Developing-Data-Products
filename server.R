# Title: Diamond price predictor
# Author: Isis Ibarra Garcia
# Date: November 25th, 2018
# Output: server.R file for the shiny app 
#
# Developing Data Products
# Peer-graded Assignment: Shiny Application and Reproducible Pitch
#
# Overview: Shiny application deployed on R server in order to predict
#           a diamond's price. 


# 1. Load libraries 
library(shiny)
library(ggplot2)
library(dplyr)
library(jcolors)

# 2. Select data
# head(diamonds)
# A tibble: 6 x 10
#   carat cut   color clarity depth table price     x     y
#   <dbl> <ord> <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl>
# 1 0.23  Ideal E     SI2      61.5    55   326  3.95  3.98
# 2 0.21  Prem… E     SI1      59.8    61   326  3.89  3.84
# 3 0.23  Good  E     VS1      56.9    65   327  4.05  4.07
# 4 0.290 Prem… I     VS2      62.4    58   334  4.2   4.23
# 5 0.31  Good  J     SI2      63.3    58   335  4.34  4.35
# 6 0.24  Very… J     VVS2     62.8    57   336  3.94  3.96
diamData <- diamonds[, c(1:4, 7)]


# 3. Define server logic required to draw a plot
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
   
    # 3.1 Select diamond depending on input
    diamData <- filter(diamonds, grepl(input$cut, cut), 
                                 grepl(input$col, color), 
                                 grepl(input$clar, clarity)
                       )
    
    # 3.2 Build predictor model 
    predModel <- lm(price ~ carat, diamData)
    predPrice <- predict(predModel, newdata = data.frame(carat = input$car,
                                                         cut = input$cut,
                                                         color = input$col,
                                                         clarity = input$clar
                                                         )
                         )
   
    # 3.3 Drow plot
    plot <- ggplot(data = diamData, aes(x = carat, y = price)) +
                   geom_point(aes(color = clarity, shape = cut, size = I(3)), alpha = 0.3) +
                   geom_smooth(method = "lm") +
                   geom_vline(xintercept = input$car, color = "black", size = 1) +
                   geom_hline(yintercept = predPrice, color = "black", size = 1) +
                   #scale_y_continuous(labels = dollar(prefix = "$", big.mark = ",")) +
      scale_y_continuous(labels = scales::dollar) +             
      scale_color_jcolors("rainbow") +
                   labs(x = "Carats", y = "Price in USD")
    plot
  })
  
  output$result <- renderText({
    
    # 3.4 Render text
    diamData <- filter(diamonds, grepl(input$cut, cut), 
                                 grepl(input$col, color), 
                                 grepl(input$clar, clarity)
                       )
    predModel <- lm(price ~ carat, diamData)
    predPrice <- predict(predModel, newdata = data.frame(carat = input$car,
                                                         cut = input$cut,
                                                         color = input$col,
                                                         clarity = input$clar
                                                         )
                         )
    predPriceOutput <- paste("The predicted value of this diamond is $", format(round(as.numeric(predPrice), 2), nsmall = 1, big.mark = ","), "USD")
    predPriceOutput
    
  })
  
})
