# Shiny
# R 코드로 웹 애플리케이션을 개발할 수 있는 프레임워크
# 웹 애플리케이션 개발 지식이 없어도 웹앱을 개발할 수 있다는 장점이 있음
library(shiny)

# # shiny.1.R
# 
# ui <- fluidPage(
#   tags$h1('Hello, Shiny!'),
#   tags$img(src='https://t1.daumcdn.net/cfile/tistory/99CDAC3F5B0152DC2E')
# )
# 
# server <- function (input, output, session) {
# 
# }
# 
# shinyApp(ui = ui, server = server)

############################################

# # ./shiny.1/ui.R
# 
# ui <- fluidPage(
#   selectInput('dataset',
#               label = 'Dataset',
#               choices = ls('package:datasets')),
#   verbatimTextOutput('summary'),
#   tableOutput('table')
# )
# 
# # ./shiny.1/server.R
# 
# server <- function(input, output) {
#   
#   output$summary <- renderPrint({
#     dataset <- get(input$dataset, 'package:datasets')
#     summary(dataset)
#   })
#   
# }
# 
# shinyApp(ui, server)

#############################################

# # shiny.2/ui.R
# 
# ui <- fluidPage(
#   selectInput('dataset',
#               label = '원하는 게 뭐야?',
#               choices = c('iris', 'state.x77')),
#   verbatimTextOutput('summary'),
#   tableOutput('table')
# )
# 
# # shiny.2/server.R
# 
# server <- function(input, output) {
#   
#   # Create a reactive expression
#   dataset <- reactive({
#     get(input$dataset, 'package:datasets')
#   })
#   
#   output$summary <- renderPrint({
#     # Use a reactive expression by calling it like a function
#     summary(dataset())
#   
#   })
#   
#   output$table <- renderTable({
#     dataset()
#   })
# }
# 
# shinyApp(ui, server)

##########################################

# library(shiny)
# library(ggplot2)
# library(gapminder)
# 
# ui <- fluidPage(
#   plotOutput('plot', click = 'plot_click'),
#   tableOutput('data')
# )
# 
# server <- function(input, output, session) {
#   output$plot <- renderPlot({
#     ggplot(gapminder, aes(gdpPercap, lifeExp,
#                           color = continent)) +
#       geom_point(alpha = 0.5) +
#       scale_x_log10(labels = scales::dollar) +
#       theme_classic()
#   }, res = 96)
#   
#   output$data <- renderTable({
#     req(input$plot_click)
#     nearPoints(gapminder, input$plot_click)
#   })
# }
# 
# shinyApp(ui, server)

############################################

# 제작한 웹앱을 Publish하기
# shinyapps.io

# ui <- pageWithSidebar(
#   
#   # 1. 헤드 패널
#   headerPanel(
#     h1('Hello, shiny!')
#   ),
#   
#   # 2. 사이드바 패널
#   sidebarPanel(
#     h3('Sidebar is Here...')
#   ),
#   
#   # 3. 메인 패널
#   mainPanel(
#     h3('Main is Here...')
#   )
# )

##############################################

# ui <- pageWithSidebar(
#   # 1. 헤더 패널
#   headerPanel(
#     h1('hello, shiny!')
#   ),
#   # 2. 사이드바 패널
#   sidebarPanel(
#     sliderInput('count',
#                 'Number of values:',
#                 min = 1,
#                 max = 10000,
#                 value = 5000)
#   ),
#   # 3. 메인 패널
#   mainPanel(
#     plotOutput('distPlot')
#   )
# )
# 
# server <- function(input, output) {
#   output$distPlot <- renderPlot({
#     dist <- rnorm(input$count)
#     hist(dist, col = 'steelblue', breaks = 50)
#   })
# }
# 
# shinyApp(ui, server)

#################################################

# ui <- pageWithSidebar(
#   headerPanel(
#     h1('Miles Per Gallon')
#   ),
#   
#   sidebarPanel(
#     selectInput('variable',
#                 '선택해봐바',
#                 list('Cylinders' = 'cyl',
#                      'Transmission' = 'am',
#                      'Gears' = 'gear')),
#     checkboxInput('outliers',
#                   '이상치도 보여줄까?',
#                   FALSE)
#   ),
#   
#   mainPanel(
#     h3('formula: '),
#     h3(textOutput('caption')),
#     plotOutput('mpgPlot')
#   )
# )
# 
# mpgData <- mtcars
# mpgData$am <- factor(mpgData$am,
#                      labels = c('Automatic', 'Manual'))
# 
# server <- function(input, output) {
#   
#   formulaText <- reactive({
#     paste('mpg~', input$variable)
#   })
#   
#   output$caption <- renderText({
#     formulaText()
#   })
#   
#   output$mpgPlot <- renderPlot({
#     boxplot(as.formula(formulaText()),
#             data <- mpgData,
#             outline = input$outliers,
#             col = 'lightyellow')
#   })
# }
# 
# shinyApp(ui, server)

#########################################

ui <- pageWithSidebar(
  headerPanel(
    h1('데이터테이블 예제')
  ),
  sidebarPanel(
    checkboxGroupInput('showvars',
                       '컬럼을 선택해보세요:',
                       names(diamonds),
                       selected = names(diamonds)),
    helpText('오른쪽에서 탭을 선택하면 다른 데이터도 볼 수 있음.')
  ),
  mainPanel(
    tabsetPanel(
      tabPanel('diamonds',
               dataTableOutput('mytable1')),
      tabPanel('mtcars',
               dataTableOutput('mytable2')),
      tabPanel('iris',
               dataTableOutput('mytable3'))
    )
  )
)

server <- function (input, output) {
  output$mytable1 <- renderDataTable({
    diamonds[, input$showvars, drop = FALSE]
  })
  output$mytable2 <- renderDataTable({
    mtcars
  })
  output$mytable3 <- renderDataTable({
    iris
  }, options = list(aLengthMenu = c(5, 30, 50),
                    iDisplayLength = 5))
}

shinyApp(ui, server)