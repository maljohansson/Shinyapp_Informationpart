
# Merge tutorial brad with what I need for CVC

# Packages ----
library(shiny)  # Required to run any Shiny app
library(ggplot2)  # For creating pretty plots
library(dplyr)  # For filtering and manipulating data
library(agridat)  # The package where the data comes from



# Loading data ----

ui <- fluidPage(
  titlePanel("Malins app"),
  sidebarLayout(
    position = "right",
    sidebarPanel(
      wellPanel(style = "background: lightgreen",   # Makes a new green bar
        textInput(inputId = "text", 
                  label = "Name", "Enter a username"),
        passwordInput(inputId = "password", 
                      label = "Password"),
        
        actionButton(inputId = "action", 
                     label = "Go!",
                     icon = icon("truck")),
      ),
      
      
      
      selectInput(inputId = "state", 
                  label = "State where you currently live",  # Give the input a label to be displayed in the app
                  choices = c("Panará" = "a","São Paulo" = "b","Minhas Reais" = "c","Bahia" = "d"), selected = "a"),  # Create the choices that can be selected. e.g. Display "A" and link to value "a"
      
     
      radioButtons(inputId = "radio", 
                   label = "Main Profession", 
                   choices = c("Farmer", "Producer", "Conservation", "Student")),
      selectInput(inputId = "select gender", 
                  label = "Gender", 
                  choices = c("Woman", "Man", "Transgender", "Other", "Prefere not to tell" )),
     
      checkboxInput(inputId = "check box", 
                    label = "Yes I agree to the terms and conditions", 
                    value = 0),
      numericInput(inputId = "age", 
                   label = "Age", 
                   value = 40, min = 18, max = 100),
      actionLink(inputId = "Hello",
                 label = "https://github.com/maljohansson",
                 icon = icon("star"))
      
    ),
    mainPanel(
      plotOutput("myhist"),
              tableOutput("mytable"),
              textOutput("mytext"),
     
       tags$div(style="color:green",   #add a link
               tags$p("Visit me at:"),
               tags$a(href = "https://github.com/maljohansson", "Malins page")
               )
  )
)
)
# server.R ----
server <- function(input, output) {}

# Run the app ----
shinyApp(ui = ui, server = server)


