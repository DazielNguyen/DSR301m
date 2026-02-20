# Import libraries
library(shiny)
library(tidyverse)

categorical_varibles = c('cyl', 'vs', 'am', 'gear', 'carb')

# Application Layout
shinyUI(fluidPage(
  br(),
  # TASK 1: Application title
  titlePanel(...),
  # Define sidebar layout with sidebar panel and main panel
  sidebarLayout(
    sidebarPanel(
      # TASK 2: Add h3 and variable select inputs for continuous/categorical 
      h3(...),
      varSelectInput(...),
      varSelectInput(...),
      # TASK 3: Add numeric input for bins and radio buttons for fill
      h3(...),
      numericInput(...),
      radioButtons(...),
      # TASK 4: Add variable map guide
      h4(...),
      p(...)
    ),
    mainPanel(
      # TASK 5: Add three panels
      tabsetPanel(
        tabPanel(...),
        tabPanel(...),
        tabPanel(...)
      )
    ),
    position = "right"
  )
))
