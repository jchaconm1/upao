library(shiny)
library(shinydashboard)
library(ggplot2)
library(plyr)
library(plotly)
library(DT)
library(ggthemes)


## Preparing sidebar items
sidebar <- dashboardSidebar(
  width = 250,
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashbd", icon = icon("dashboard")),
    menuItem("Base de Datos", tabName = "datafile", icon = icon("th")),
    menuItem("Modelo", tabName = "model", icon = icon("line-chart")),
    menuItem("Análisis Personalizado", icon = icon("navicon"), tabName = "graphs", 
             menuSubItem("Paciente 1", tabName = "p1", icon = icon("user")), 
             menuSubItem("Paciente 2", tabName = "p2", icon = icon("male")),
             menuSubItem("Paciente 3", tabName = "p3", icon = icon("user-circle"))
    ),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    hr(),
    # email sharing link
    menuItem("Feedback & suggestion", icon = icon("envelope-o"),
             href = "mailto:?ow.raza@hotmail.com?subject=Feedback on VAS app"),
    # source code link
    menuItem("Source code", icon = icon("file-code-o"), 
             href = "https://github.com/oraza/sectarianviolencePK"),
    # github fork link
    menuItem("Fork me @ github", icon = icon("code-fork"), 
             href = "https://github.com/oraza/sectarianviolencePK") 
  )
)
## Preparing body items
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashbd",
            fluidRow(
              valueBoxOutput("vbox1", width = 6),
              valueBoxOutput("vbox2", width = 6)),
            h2("Monitoreo de pacientes con problemas cardiovasculares en la realización de rutinas
                de ejercicios mediante algoritmos de clasificación discreta",  align = "center", style = "font-family: 'times'; color:red"),
            br(),
            br(),
            p("Esta plataforma web es desarrollada como parte del programa de data science.
              Tiene la finalidad de presentar de forma resumida y eficáz tanto el análisis
              de datos, como la visualización de los mismos.", style = "font-family: 'times'"),
           
            fluidPage(
              fluidRow(
                br(),
                br(),
                br(),
                column(
                  h3("Acerca del Proyecto", align = "center", style = "font-family: 'times'; color:red"),
                  p("Una breve descripción del diseño experimental",
                    style = "font-family: 'times'"),
                  width = 4,
                  align = "left"
                  
                ),
                column(
                  h3("Cómo usarla", style = "font-family: 'times'; color:red"),
                  p("Esta plataforma tiene tres sección principales; base de datos,
                    modelo discreto y análisis personalizado. En la sección de base de datos
                    se presentan las muestras representativas del total de la base de datos
                    para brindar al usuario una breve comprensión de la misma. En la sección
                    de modelo discreto se encuentra los resultados de la creación y evaluación
                    delo modelo realizado. Por último, en la sección de análisis personalizado
                    se encuentran las estadísticas por paciente", 
                    style = "font-family: 'times'"), 
                  width = 8,
                  align = "left"
                ),
                br(),
                br()
                  )
                ),
            br()
    ),  
    tabItem(tabName = "datafile",
            box(title = "Datos recuperados con dispositivos tipo wereable",
                width = 12, 
                DT::dataTableOutput('da.tab'))  
    ),
    tabItem(tabName = 'model',
            mainPanel(tabsetPanel(
              tabPanel('Modelo',
                       p('Información sobre el modelo de clasificación'))  
            )
            )
    ),
    
    tabItem(tabName = "p1",
            mainPanel(
              tabsetPanel(
                tabPanel("Rutina",
                         plotlyOutput("PltP1"), width = "auto")
                ))
    ),
    tabItem(tabName = "p2",
            mainPanel(
              tabsetPanel(
                tabPanel("Rutina",
                         plotlyOutput("PltP2"), width = "auto")
              )
            )
    ),
    tabItem(tabName = "p3",
            mainPanel(
              tabsetPanel(
                tabPanel("Rutina",
                         plotlyOutput("PltP3"), width = "auto")
              )
            )
    )
  )
)
## Putting them together into a dashboardPage

ui <- dashboardPage( 
  skin="yellow",
  # add this -> navbarMenu()
  dashboardHeader(
    title="Data Science",
    titleWidth = 250,
    #Facebook Sharing
    tags$li(class = "dropdown",
            tags$a(href = "https://www.facebook.com/jchaconmego", 
                   target = "_blank", 
                   tags$img(height = "20px", 
                            src = "fb2.png")
            )
    ),
    # Linkedin link
    tags$li(class = "dropdown",
            tags$a(href = "https://www.linkedin.com/in/josue-german-chacon-mego-2a182053/", 
                   target = "_blank", 
                   tags$img(height = "20px", 
                            src = "linkedin.png")
            )
    ),
    # Twitter link
    tags$li(class = "dropdown",
            tags$a(href = "https://twitter.com/J0oosu3",
                   target = "_blank",
                   tags$img(height = "20px", 
                            src = "twitter.png")
            )
    ),
    # Github link
    tags$li(class = "dropdown",
            tags$a(href = "github.com/jchaconm1",
                   target = "_blank",
                   tags$img(height = "20px", 
                            src = "github.png")
            )
    )
  ),
  sidebar,
  body
)