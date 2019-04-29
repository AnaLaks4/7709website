library(shiny)

# USER INTERFACE
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      # put web page elements here
      # usually shiny widgets
      actionButton("action1", label = "Scratch"),
      actionButton("action2", label = "Slap"),
      sliderInput("slider1", label = h3("Slider"), min = 0, 
                  max = 100, value = 50),
      selectInput("select", label = h3("Select box"), 
                  choices = list("Choice 1" = 1,
                                 "Choice 2" = 2, 
                                 "Choice 3" = 3), 
                  selected = 1)
      
    ),
    mainPanel(
      # put web page elements here
      # usually to display things
      plotOutput("plot1"),
      plotOutput("plot2"),
      textOutput("text1")
      
    )
  )
)

# SERVER
server <- function(input, output) {

  observeEvent(input$action1,{
    print("Hello")
  })  

  
  output$plot1 <- renderPlot({
    hist(rnorm(100,input$slider1,1))
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)