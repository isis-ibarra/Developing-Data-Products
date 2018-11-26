Diamond price predictor
========================================================
author: Isis Ibarra García
date: November 25th, 2018
autosize: true
font-family: 'Helvetica'

<style>
.small-code pre code {
  font-size: 0.875em;
}
</style>



Introduction
========================================================
<small>
This presentation is part of Developing Data Products class and has the documentation for the [**Diamond Price Prediction application**](https://isisibarra.shinyapps.io/DiamondPrice/).

The application goal is to predict a diamond's price by applying a linear regression model to the selected characteristics. The user can choose a value from the following properties:
- Carat
- Cut
- Color
- Clarity

The application was built using Shiny web application and deployed using the R server. Both files can be found within the [**Github repo**](https://github.com/isis-ibarra/Developing-Data-Products).
</small>

Diamonds dataset
========================================================
class: small-code
<small>
Diamonds dataset was used for this application.  
It contains the information for 53940 diamonds with 10 variables:



```
     carat               cut        color        clarity          depth           table           price             x                y                z         
 Min.   :0.2000   Fair     : 1610   D: 6775   SI1    :13065   Min.   :43.00   Min.   :43.00   Min.   :  326   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
 1st Qu.:0.4000   Good     : 4906   E: 9797   VS2    :12258   1st Qu.:61.00   1st Qu.:56.00   1st Qu.:  950   1st Qu.: 4.710   1st Qu.: 4.720   1st Qu.: 2.910  
 Median :0.7000   Very Good:12082   F: 9542   SI2    : 9194   Median :61.80   Median :57.00   Median : 2401   Median : 5.700   Median : 5.710   Median : 3.530  
 Mean   :0.7979   Premium  :13791   G:11292   VS1    : 8171   Mean   :61.75   Mean   :57.46   Mean   : 3933   Mean   : 5.731   Mean   : 5.735   Mean   : 3.539  
 3rd Qu.:1.0400   Ideal    :21551   H: 8304   VVS2   : 5066   3rd Qu.:62.50   3rd Qu.:59.00   3rd Qu.: 5324   3rd Qu.: 6.540   3rd Qu.: 6.540   3rd Qu.: 4.040  
 Max.   :5.0100                     I: 5422   VVS1   : 3655   Max.   :79.00   Max.   :95.00   Max.   :18823   Max.   :10.740   Max.   :58.900   Max.   :31.800  
                                    J: 2808   (Other): 2531                                                                                                     
```
</small>

Application functionality
========================================================

<span style = "font-weight:bold; color:green;"> Slidebar </span>
<small>
The application displays a sidebar, where the user can select some of the diamonds unique characteristics, such as carat, cut, clarity and color. Once selected, the application calculates the regression model and displays the predicted price.
</small>

<span style = "font-weight:bold; color:green;"> Plot </span>
<small>
The application plots the carats of the diamond on the x-axis and its corresponding price on the y-axis. It also help the user to make a distinction in the clarity and cut of the diamond, by subsetting the plot marks in colors (clarity) and shapes (cut). The regression line is shown on the plot as well. 
</small>

Diamonds plot
========================================================

<img src="DiamondPrice-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

***
<small>
The plot shown at the left, is the default settings used at the application. 

The predicted price for a 0.8 carat diamond is $3,948.78 USD.
</small>
