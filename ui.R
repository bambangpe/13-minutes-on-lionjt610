library(shiny)
library(shinythemes)
library(plyr)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(dplyr)
ui <- shinyUI(navbarPage(
  theme = shinytheme("superhero"),
  strong("13 minutes of Lion Air JT610"),
  tabPanel("About",
           mainPanel(
             fluidRow(
      p("-- Lion Air flight JT610 departed Jakarta for Pangkal Pinang at 06:20 local time (23:20 UTC) on 29 October,--",align='Justify'), 
      p("-- and lost contact shortly after departure.  The flight was operated by Boeing 737 MAX 8 registration PK-LQP.--",align='Justify'), 
      p("-- The aircraft was delivered to Lion Air on 13 August 2018, just over two months ago and entered service,--",align='Justify'),  
      p("-- with the airline on 18 August.It is powered by two CFM LEAP-1B engines.--",align='Justify')))),
      
   navbarMenu("Data",
             tabPanel("Data JT610",
                      mainPanel(
                        fluidRow(
                          #h3(strong('Data Source')),
                          #p('data:Fligtradar24',align='Justify'),
                         
                          h3(strong('Table Data JT610')),
                          dataTableOutput("d")))),
             tabPanel("Data JT43",
                      mainPanel(
                        fluidRow(
                         # h3(strong('Data Source')),
                          #p('data:Fligtradar24',align='Justify'),
                         
                          h3(strong('Table Data JT43')),
                          dataTableOutput("d1")))),
             
             tabPanel("Graph process",
                      mainPanel(
                        fluidRow(
                          h3(strong('Graph Code')),
                          p('gd <- ggplot(d,aes(x=Timestamp))+',align='Justify'),
                          p('geom_line(aes(y=Altitude, color="Altitude"))+',align='Justify'),
                          p('geom_point(aes(y=Altitude), colour="red")+',align='Justify'),
                          p(' geom_line(aes(y=Speed*10, color="Speed"))+',align='Justify'),
                          p('geom_point(aes(y=Speed*10), colour="blue")+',align='Justify'),
                          p('labs(color="Note")+',align='Justify'),
                          p('theme(axis.text.x = element_text(angle = 90))+',align='Justify'),
                          p('labs(x="")+',align='Justify'),
                          p('labs(y="")',align='Justify'),
     p('gd1 <- ggplot(d1,aes(x=Timestamp))+',align='Justify'),
     p('geom_line(aes(y=Altitude, color="Altitude"))+',align='Justify'),
     p('geom_point(aes(y=Altitude), colour="red")+',align='Justify'),
     p('geom_line(aes(y=Speed*10, color="Speed"))+',align='Justify'),
     p('geom_point(aes(y=Speed*10), colour="blue")+',align='Justify'),
     p('labs(color="Note")+',align='Justify'),
     p('theme(axis.text.x = element_text(angle = 90))+',align='Justify'),
     p('labs(x="")+',align='Justify'),
     p('labs(y="")',align='Justify'),
  
     p('gd2 <- ggplot(d2,aes(x=Timestamp))+',align='Justify'),
     p('geom_line(aes(y=Altitude, color="Altitude"))+',align='Justify'),
     p('geom_point(aes(y=Altitude), colour="red")+',align='Justify'),
     p('geom_line(aes(y=Speed*10, color="Speed"))+',align='Justify'),
     p('geom_point(aes(y=Speed*10), colour="blue")+',align='Justify'),
     p('labs(color="Note")+',align='Justify'),
     p('theme(axis.text.x = element_text(angle = 90))+',align='Justify'),
     p('labs(x="")+',align='Justify'),
     p('labs(y="")',align='Justify'))))),
     
             tabPanel("Take off JT610",
                    
                      mainPanel(
                        fluidRow(
                          h3('Graph 11 minute takeoff'),
                          #p('data altitude, speed,time',
                           # align='justify'),
                          
                          column(10,h4(plotOutput("gd"))
                          #column(10,h4(strong("Table")),tableOutput("d"))
                          #column(10,h4(strong('Accuracy Bar Plot')),plotOutput("Plot2"))
                        )
                      )
             )),
  
          tabPanel("Flight Denpasar-Jakarta",
                    
                      mainPanel(
                        fluidRow(
                          h3('Graph Flight Denpasar-Jakarta'),
                          #p('Gender,SeniorCtz,Partner,Dependent',
                          #  align='justify'),
                          column(10,h4(plotOutput("gd1"))
                        )
                      )
             )),
  
  tabPanel("First minute Takeoff Jakarta-Denpasar ",
                    
                      mainPanel(
                        fluidRow(
                          h3('Graph First minute Takeoff'),
                          #p('Gender,SeniorCtz,Partner,Dependent',
                          #  align='justify'),
                          column(10,h4(plotOutput("gd2"))
                        )
                      )
             )),
  
  
  tabPanel("Interpretation",
           h3(strong("Interpretation")),
           br(),
           p("1. This graph gives a simple description of aircraft behavior in the first minute of flight"),
           p("2. The plane had difficulty reaching heights like normal planes"),
           p("3. Speed up and down along with 11 minute flight"),
           p("4. The plane has experienced trouble since flights from Denpasar-Jakarta"),
           br(),
           p("Data scrap from Flightradar24.com, application crafted by bambangpe")
           )
  
  )
)
