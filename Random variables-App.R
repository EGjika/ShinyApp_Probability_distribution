# 1. Start template 1
library(shiny)
ui <- fluidPage(
)
server <- function(input, output) {}
shinyApp(server = server, ui = ui)

# 2. Add a Slider Input

library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number by sliding",
              value = 50, min = 0, max = 100)
)
server <- function(input, output) {}
shinyApp(server = server, ui = ui)

# 3. Add a plotOutput

library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number by sliding",
              value = 50, min = 0, max = 100),
  plotOutput("hist")
)
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

# 4. Display a plot
library(shiny)
ui <- fluidPage(
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(100))
  })
}
shinyApp(ui = ui, server = server)

# 5. Display a plot by changing the slider input

library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number by sliding",
              value = 50, min = 0, max = 100),
  plotOutput("hist")
)

server<-function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}
shinyApp(ui = ui, server = server)

# 6. Action Button

library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number by sliding",
              value = 50, min = 0, max = 100),
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),

  plotOutput("hist")
)
server <- function(input, output) {
  rv <- reactiveValues(data = rnorm(100))
  observeEvent(input$norm, { rv$data <- rnorm(100) })
  observeEvent(input$unif, { rv$data <- runif(100) })

  output$hist <- renderPlot({
    hist(rv$data)
  })
}
shinyApp(ui = ui, server = server)

#7 Add another type of random numbers and boxplot
library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number by sliding",
              value = 50, min = 0, max = 100),
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),
  actionButton(inputId = "exp", label = "Exponential"),
  
  plotOutput("hist"),
  plotOutput("boxplot")
)
server <- function(input, output) {
  rv <- reactiveValues(data = rnorm(100))
  observeEvent(input$norm, { rv$data <- rnorm(100) })
  observeEvent(input$unif, { rv$data <- runif(100) })
  observeEvent(input$exp, { rv$data <- rexp(100) })
  
  output$hist <- renderPlot({
    hist(rv$data)
  })
  output$boxplot <- renderPlot({
    boxplot(rv$data)
  })
}
shinyApp(ui = ui, server = server)

# 8. Add another type of probability distribution
library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number by sliding",
              value = 50, min = 0, max = 1000),
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),
  actionButton(inputId = "exp", label = "Exponential"),
  
  plotOutput("hist"),
  plotOutput("boxplot")
)
server <- function(input, output) {
  rv <- reactiveValues(data = rep(0,100))
  observeEvent(input$norm, { rv$data <- rnorm(100) })
  observeEvent(input$unif, { rv$data <- runif(100) })
  observeEvent(input$exp, { rv$data <- rexp(100) })
  
  output$hist <- renderPlot({
    hist(rv$data)
  })
  output$boxplot <- renderPlot({
    boxplot(rv$data)
  })
}
shinyApp(ui = ui, server = server)

# 9.Some formating to make it even better
library(shiny)
ui <- fluidPage(
  titlePanel("Random number generator"),
   h4("This shiny app will help you understand probability distribution."),
  HTML('
  <p> <a href="https://al.linkedin.com/in/eralda-dhamo-gjika-71879128" target="_blank"> Author:Eralda Gjika (Dhamo)</a><br>
  '),
  sliderInput(inputId = "num",
              label = "Choose a number (use slider)",
              value = 50, min = 0, max = 1000),
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),
  actionButton(inputId = "exp", label = "Exponential"),
  actionButton(inputId = " pois", label = " Poisson"),
  plotOutput("hist"),
  plotOutput("boxplot")
  )
server <- function(input, output) {
  rv <- reactiveValues(data = rep(0,1000))
  observeEvent(input$norm, { rv$data <- rnorm(1000) })
  observeEvent(input$unif, { rv$data <- runif(1000) })
  observeEvent(input$exp, { rv$data <- rexp(1000) })
  observeEvent(input$pois, { rv$data <- rpois(1000) })
  output$hist <- renderPlot({
    hist(rv$data,col="red",main="Histogram of data")
  })
  output$boxplot <- renderPlot({
    boxplot(rv$data, col="darkblue",main="Boxplot of data")
  })
}
shinyApp(ui = ui, server = server)

# Enjoy!For more follow me:  https://al.linkedin.com/in/eralda-dhamo-gjika-71879128 