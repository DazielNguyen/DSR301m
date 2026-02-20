# Load libraries

library(shiny)
library(tidyverse)
library(ggthemes)


# Read in data
adult <- read_csv("adult.csv", show_col_types = FALSE)
names(adult) <- tolower(names(adult))

# Define server logic
shinyServer(function(input, output) {
  
  df_country <- reactive({
    adult %>% dplyr::filter(native_country == input$country)
  })
  
  # TASK 5: Plot histogram or boxplot
  output$p1 <- renderPlot({
    if (input$graph_type == "histogram") {
      ggplot(df_country(), aes(x = .data[[input$continuous_variable]])) +
        geom_histogram(binwidth = 2) +
        labs(y = "Number of People", 
             title = paste("Trend of", input$continuous_variable)) + 
        facet_wrap(~prediction) + 
        theme_economist()
    } else {
      ggplot(df_country(), aes(y = .data[[input$continuous_variable]])) +
        geom_boxplot() +
        coord_flip() + 
        labs(x = "Number of People", 
             title = paste("Trend of", input$continuous_variable)) + 
        facet_wrap(~prediction) + 
        theme_economist()
    }
  })
  
  # TASK 6: Plot faceted or stacked bar chart
  output$p2 <- renderPlot({
    p <- ggplot(df_country(), aes(x = .data[[input$categorical_variable]])) + 
      labs(y = "Number of People", 
           title = paste("Trend of", input$categorical_variable)) + 
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1), 
            legend.position = "bottom",
            legend.text = element_text(size = 14),
            legend.key.size = unit(0.8, "cm"),
            legend.box.spacing = unit(0.3, "cm"))

    if (input$is_stacked) {
      p + geom_bar(aes(fill = prediction))
    } else {
      p + geom_bar(aes(fill = .data[[input$categorical_variable]])) + 
        facet_wrap(~prediction)
    }
  })
})