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

```{r cars, echo=FALSE, warning=FALSE}
library(readxl)
library(knitr) "Por si llegamos a trabajar en knitr"
Regresion <- read_excel("")
kable(head(Regresion))
```

## Primer parte / Contexto Variables Explicativas
Utilizaremos 5 variables en nuestro modelo, una variable de interes o de respuesta y 4 variables explicativas o predictorias, cada una acompañada de su respectivo gráfico para tener un mayor entendimiento.

En primera medida, tenemos la variable de respuesta: 

modelo <- glm(descuento ~privada+seguidores+origen+etcétera, data = Data, family = binomial(link="logit"))
