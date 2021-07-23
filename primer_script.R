
# Librerias ####

library(tidyverse)
library(lubridate)
library(twitteR)
library(fst)

# Aquí un codigo mínimo de extracción de datos de twitter que utilizaremos como primer
# script de trabajo para construir el monitoreo descentralizado de fenómenos de desinformación
# en contexto de pandemia.

#seteamos nuestros permisos a la api de twitter

#se consiguen aca: https://developer.twitter.com/en

setup_twitter_oauth(consumer_key = "XXX",     #el numero es una serie alfanumerica que va entre las comillas, reemplazan las X con el numero que les da twitter.
                    access_token = "XXX",
                    consumer_secret = "XXX",
                    access_secret = "XXX")


options(scipen = 999) #notacion cinetifica off


searchTwitter("paso2021", n=100) # ej con este codigo buscamos 100 tweets random de las ultimas semanas con la palabra "PASO 2021"



searchTwitter('paso2021', since='2021-07-19', until='2021-07-23') # ej repetimos la busqueda entre dos fechas (buscamos la ultima semana)
# lo ajustamos a la ultima semana



#Alternativa 1

#repetimos el codigo geolocalizado para la municipio de Lanús, Provincia de Buenos Aires
resultadostw<-searchTwitter('paso2021', geocode='-34.70043,-58.3973,5mi', #toma como centro lanús y analiza tweets a 5 millas del punto marcado.
              since='2021-07-19', until='2021-07-23', n = 100) #pide 100 tweets


resultadostw_df <- twListToDF(resultadostw) #pasamos el resultado que nos devuelve la api a df


head(resultadostw_df) #Checkeamos

 #guardamos el archivo en formato fst

write.fst(resultadostw_df, "resultadostw_df.fst")


#Alternativa 2


#usamos boleanos para ver que resultados hay asociados a lanus y las paso2021 e internas
#de momento si usamos esta combinacion vamos a tener muy pocos resultados

resultadostw2<-searchTwitter('lanús + internas', 
                             #geocode='-34.70043,-58.3973,5mi', frizamos el geocode
                             since='2021-07-19', until='2021-07-23', n = 100) 


#esta ultima tambien tiene pocos, pero es una alternativa para empezar a construir el problema.


resultadostw2<-searchTwitter('lanús + internas', 
                            #geocode='-34.70043,-58.3973,5mi', frizamos el geocode
                            since='2021-07-19', until='2021-07-23', n = 100) 


resultadostw_df2 <- twListToDF(resultadostw2) #pasamos el resultado que nos devuelve la api a df


head(resultadostw_df2) #Checkeamos


write.fst(resultadostw_df2, "resultadostw_df2.fst")




