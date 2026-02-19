library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(
  function(input, output) {
    output$histPlot <- renderPlot({
      # Draw the histogram with the specified bins, input$bins
      ggplot(mtcars, aes(x = hp)) +
        geom_histogram(bins = input$bins, fill = "skyblue", color = "white") +  
        labs(x = "Horsepower",
             y = "Frequency",
             title = "Distribution of Horsepower in mtcars"
        ) +
        theme(text = element_text(size = 20))
    })
  }
)
