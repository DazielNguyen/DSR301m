# app.R
library(shiny)

# Load the trained model
model <- readRDS("best_model_study_hours.rds")

ui <- fluidPage(
  titlePanel("Predicted Study Hours/Day"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("gender", "Gender:",
                  choices = c("Female" = 0, "Male" = 1, "Other" = 2)),
      
      selectInput("part_time_job", "Part-time Job:",
                  choices = c("No" = 0, "Yes" = 1)),
      
      selectInput("diet_quality", "Diet Quality:",
                  choices = c("Fair" = 0, "Good" = 1, "Poor" = 2)),
      
      selectInput("parental_education_level", "Parental Education:",
                  choices = c("Other" = 0, "High School" = 1, "Master" = 2)),
      
      selectInput("internet_quality", "Internet Quality:",
                  choices = c("Average" = 0, "Good" = 1, "Poor" = 2)),
      
      selectInput("extracurricular_participation", "Extracurricular Participation:",
                  choices = c("No" = 0, "Yes" = 1)),
      
      sliderInput("social_media_hours", "Social Media (hrs/day):", 0, 10, value = 2, step = 0.5),
      sliderInput("netflix_hours", "Netflix (hrs/day):", 0, 10, value = 1, step = 0.5),
      sliderInput("sleep_hours", "Sleep (hrs/day):", 3, 10, value = 7, step = 0.5),
      sliderInput("attendance_percentage", "Class Attendance (%):", 0, 100, value = 90, step = 1),
      sliderInput("exam_score", "Final Exam Score:", 0, 100, value = 75, step = 1),
      
      numericInput("mental_health_rating", "Mental Health Rating (1-10):", value = 5, min = 1, max = 10),
      numericInput("exercise_frequency", "Exercise Frequency (days/week):", value = 3, min = 0, max = 7),
      
      actionButton("predict", "Predict")
    ),
    
    mainPanel(
      h4("Predicted Study Hours/Day:"),
      verbatimTextOutput("prediction_output")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$predict, {
    input_data <- data.frame(
      social_media_hours = input$social_media_hours,
      netflix_hours = input$netflix_hours,
      sleep_hours = input$sleep_hours,
      mental_health_rating = as.numeric(input$mental_health_rating),
      exercise_frequency = as.numeric(input$exercise_frequency),
      exam_score = input$exam_score,
      part_time_job = as.integer(input$part_time_job),
      gender = as.integer(input$gender),
      parental_education_level = as.integer(input$parental_education_level),
      extracurricular_participation = as.integer(input$extracurricular_participation),
      attendance_percentage = input$attendance_percentage
    )
    
    prediction <- tryCatch({
      pred <- predict(model, newdata = input_data)
      paste0(round(pred, 2), " hours/day")
    }, error = function(e) {
      paste("Prediction failed:", e$message)
    })
    
    output$prediction_output <- renderText({ prediction })
  })
}

shinyApp(ui = ui, server = server)



