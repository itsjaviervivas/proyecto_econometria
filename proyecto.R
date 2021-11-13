title: "Proyecto Final Econometría Básica"
author: ''
date: "15/11/2021"
output:
  word_document: default
  html_document: default
  pdf_document: default

## Objetivo
En la presente investigación se propone identificar el funcionamiento del mercado de maquillaje en la red social Instagram. 
Para ello se propone obtener datos estadísticos por medio de trabajos de campo que busquen responder a la pregunta: ¿El precio de las paletas de maquillaje cambia cuando la compra proviene de una cuenta privada o pública?.

Para obtener resultados más acordes a la investigación se utilizará como variable a explicar el precio (del producto). 
De igual manera se tomarán como variables explicativas el número de seguidores que las empresas dispongan en su página de Instagram, el objetivo (target) de la tienda o mercancía, el origen del producto (nacional o internacional) ya que puede afectar el precio y finalmente, la variable más importante es si el hecho que la cuenta del consumidor, que pregunta el precio, es privada o pública puede afectar el precio, y si además pueda ser tomada como factor de descuento sobre el producto. 


library(readr)
library(stargazer)
library(margins)
library(foreign);library(car); library(lmtest); library(sandwich) 

rm(list = ls())
choose.files()

base <- read.csv("C:\\Users\\andre\\OneDrive\\Documentos\\Base de datos.csv")
basec <- na.omit(base)
attach(basec)
mlin <- lm(Descuento.dado~Privada+Seguidores+Producto.nacional+Precio.dado+Precios.publicos, data = basec)
summary(mlin)
coeftest(mlin, vcov = vcovHC(mlin, "HC1"))

linfit=fitted(mlin)
cplot(mlin,"Privada")        

mlinres=resid(mlin)
bptest(mlin, ~ fitted(mlin) + I(fitted(mlin)^2))

margins(mlin, vcov = vcovHC(mlin, "HC1") )

mpro<-glm(Descuento.dado~Privada+Seguidores+Producto.nacional+Precio.dado+Precios.publicos, data = basec, family=binomial(link=probit))
summary(mpro)
profit<-fitted(mpro)
cplot(mpro, "Privada")

marpro <- margins(mpro, vcov = vcovHC(mpro, "HC1") )
summary(marpro)
cplot(mpro, "Privada", what = "effect")

mlog<-glm(Descuento.dado~Privada+Seguidores+Producto.nacional+Precio.dado+Precios.publicos, data = basec, family=binomial(link=logit))
summary(mlog)
logfit<-fitted(mlog)
cplot(mlog, "Privada")

marlog <- margins(mlog, vcov = vcovHC(mlog, "HC1") )
summary(marlog)
cplot(mlog, "Privada", what = "effect")

# modelo para precios

mpre <- lm(Precio.dado~Privada+Seguidores+Producto.nacional+target, data = basec)
summary(mpre)
cplot(mpre, "Privada")


