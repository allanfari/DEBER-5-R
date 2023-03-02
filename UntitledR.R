---
  title: "Untitled"
author: "ALLAN"
date: "2023-03-02"
output: html_document
---

##{r librerias}
  install.packages("colourpicker")
library(ggplot2); library(ggpubr); library(ggpmisc); library(dplyr); library(tidyverse); library(ggpp); library(colourpicker)

##datos usados ya existentes en R
help("who")


##asignacion de variable dt
dt= who


#1. Datos de niñas y niños entre 0 y 14 años.
##{r 0a14}
pr <- dt %>% select("year", "new_sp_m014", "new_sp_f014" )
prf= pr %>% filter(new_sp_m014 > 0)
prm= prf %>% filter(new_sp_f014 > 0)
prm


#2. Datos del año 1996 en adelante (1996 - 2012).
##{r 1996}
dt3= prm %>% filter(year >= 1996)
dt3

#nubes de puntos por separado Y SE GUARDA EL ARCHIVO IMAGEN en un documento pdf.

gf= dt3 %>% ggplot(aes(x=new_sp_m014, y =new_sp_f014, color = factor(year)))+ geom_point(size = 0.2) + facet_wrap(year ~. ,scales = "free") + geom_smooth(method = "lm", formula = y ~ x) + xlim(0,900) + ylim(0,1500) + labs(y= "Casos positivos de TB en niños de 0 a 14 años", x= "Casos positivos de TB en niños de 0 a 14 años") + stat_poly_eq(aes(label =  paste(..eq.label.., ..adj.rr.label.., sep = "~~~~")),
                                                                                                                                                                                                                                                                                                                                                     formula = y~x, parse = TRUE, label.x.npc= 0. , label.y.npc= 1000)
ggsave(filename = "tarea.pdf", height = 17, width = 17,
       plot = gf, dpi = 700)
gf
