modelo <- glm(descuento ~privada+seguidores+origen+etcétera, data = Data, family = binomial(link="logit"))
