# Import the library
library(shiny)

# Create UI
shinyUI(
  fluidPage(
    # TASK 1: Application title
    titlePanel("Mtcars Horsepower Histogram"),
    # Define vertical layout
    verticalLayout(
      # TASK 2: Add plot output
      plotOutput("histPlot"),
      # TASK 3: Add slider input
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    )
  )
)
