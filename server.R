library(shiny)
library(shinythemes)
library(plyr)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(dplyr)
d <- read.csv("./data/J11.csv")
d
gd <- ggplot(d,aes(x=Timestamp))+
  geom_line(aes(y=Altitude, color="Altitude"))+
  geom_point(aes(y=Altitude), colour="red")+
   geom_line(aes(y=Speed*10, color="Speed"))+
  geom_point(aes(y=Speed*10), colour="blue")+
   labs(color="Note")+
   theme(axis.text.x = element_text(angle = 90))+
   labs(x="")+
   labs(y="")
 plot(gd)
 
 d1 <- read.csv("./data/JT43.csv")
 d1
 gd1 <- ggplot(d1,aes(x=Timestamp))+
  geom_line(aes(y=Altitude, color="Altitude"))+
  geom_point(aes(y=Altitude), colour="red")+
   geom_line(aes(y=Speed*10, color="Speed"))+
  geom_point(aes(y=Speed*10), colour="blue")+
   labs(color="Note")+
   theme(axis.text.x = element_text(angle = 90))+
   labs(x="")+
   labs(y="")
 plot(gd1)
 
 d2 <- d1[150:250,]
 d2
 gd2 <- ggplot(d2,aes(x=Timestamp))+
  geom_line(aes(y=Altitude, color="Altitude"))+
  geom_point(aes(y=Altitude), colour="red")+
   geom_line(aes(y=Speed*5, color="Speed"))+
  geom_point(aes(y=Speed*5), colour="blue")+
   labs(color="Note")+
   theme(axis.text.x = element_text(angle = 90))+
   labs(x="")+
   labs(y="")
 plot(gd2)
 server <- shinyServer(function(input,output,session){
  output$d <- renderDataTable({d}, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))
  output$d1 <- renderDataTable({d1}, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))
  output$d2 <- renderDataTable({d2}, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 5))
  
  output$gd <- renderPlot({plot(gd)})
  output$gd1 <- renderPlot({plot(gd1)})
  output$gd2 <- renderPlot({plot(gd2)})
  })
