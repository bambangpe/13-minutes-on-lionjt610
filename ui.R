library(shiny)
library(shinythemes)
library(plyr)
library(corrplot)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(party)
library(dplyr)

ui <- shinyUI(navbarPage(
  theme = shinytheme("superhero"),
  strong("13 minutes of Lion Air JT610"),
  #---
  tabPanel("Home",
             tags$head(
               tags$style(HTML(".my_style_1{ margin-top: -20px; margin-left: -15px; margin-right: -15px;
                               background-image: url(https://www.boeing.com/resources/boeingdotcom/commercial/737max/entry-into-service/assets/images/customers/mli2/image-full-1.jpg);
                               background-size: 100% auto;background-repeat: no-repeat
                               }"))),
             #ada di http://dailypooper.com/uploads/original_photos/Article_Images/1912448032.aircrash.jpg
             class="my_style_1",
             fluidPage(
               fluidRow(
                 column(3,
                        "" ),
                 column(5,
                        br(),
                        br(),
                        br(),
                        h1("Lion JT610 Insight"),br(),
                        h4("Berdoalah dimanapun anda beraktivitas, karena hanya Tuhanlah yang menentukan hidup mati kita, Pray wherever you move, because only God determines your dead or life."),
                        h4("--Itu kata orang bijak--"))
                 
               ),
               fluidRow(
                 br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),""
               )
               
               
             )),
  #---
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
