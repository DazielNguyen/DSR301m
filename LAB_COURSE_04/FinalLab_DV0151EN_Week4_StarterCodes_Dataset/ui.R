# Load libraries

library(shiny)
library(tidyverse)
library(ggthemes)

# Application Layout
shinyUI(fluidPage(
  br(),
  # TASK 1: Application title
  titlePanel("Trends in Demographics and Income"),
  p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demographic information."), 
  
  # TASK 2: Country selection
  fluidRow(
    column(12, wellPanel(
      selectInput("country", "Country:", 
                  choices = c("United-States", "Canada", "Mexico", "Germany", "Philippines"))
    ))
  ),
  
  # TASK 3: Continuous variables
  fluidRow(
    column(3, wellPanel(
      p("Select a continuous variable and graph type (histogram or boxplot) to view on the right."), 
      radioButtons("continuous_variable", "Continuous:", 
                   choices = c("age", "hours_per_week")), 
      radioButtons("graph_type", "Graph:", 
                   choices = c("histogram", "boxplot"))
    )),
    column(9, plotOutput("p1"))
  ),
  
  # TASK 4: Categorical variables
  fluidRow(
    column(3, wellPanel(
      p("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph."),
      radioButtons("categorical_variable", "Categorical:", 
                   choices = c("education", "workclass", "sex")),
      checkboxInput("is_stacked", "Stack bars", value = FALSE)
    )),
    column(9, plotOutput("p2"))
  )
))