library(shiny)
library(shinySignals)
library(dplyr)
library(shinydashboard)
library(bubbles)
library(jpeg) 

load("oscars_summary.RData")

dashboardPage(
  dashboardHeader(title = "Oscar Recommender"),
  dashboardSidebar(
    br(),
    selectInput("inputOscar", "What is your favorite movie from Oscar winners?",
                choices = levels(movie$Name), width = '98%'),
    br(),
    selectInput("inputGenre", "What is your favorite movie genre?",
                choices = levels(movie$Type), width = '98%'),
    br(),
    br(),
    actionButton("click", label = "I don't like this one.",width="98%")
  ),
  dashboardBody(
   fluidRow(
      valueBoxOutput("rec"),
      valueBoxOutput("twitter"),
      valueBoxOutput("tomato")
    ),
    fluidRow(
      box(
        width = 8, solidHeader = TRUE,
        title = "Recommended Movie",status = "primary",
        imageOutput("poster", width = "100%", height = 600),
        background ="black"
      ),
      box(
        width = 4, solidHeader = TRUE,
        title = "User Guide",status = "primary",
        p("*",strong("Step 1:")," Choose your favorite Oscar winner from the options;" ),
        br(),
        p("*",strong("Step 2:")," Choose your favorite movie genre from the options;"),
        p("Recommened movie will be given with:"),
        code("Movie Name"), br(),
        code("Twitter Rate"), br(), 
        code("Rotten Tomato Rate"), br(),
        br(),
        p("*",strong("Step 3:")," If you don't like this moive, click"),
        code("I don't like this one."),
        p("to get another recommened movie."),
        background ="black",
        tableOutput("packageTable")
      )
    )
  )
)