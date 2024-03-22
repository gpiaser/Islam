year=2000

# Sélectionner les lignes où la valeur de la colonne "Year" est year
GDP_i <- GDP[GDP$Year == year, ]
GDP_w <- data.frame(Code = GDP_i$Code, GDPc = GDP_i$GDPc)



# Sélectionner les lignes où la valeur de la colonne "Year" est year
Fer_i <- fertility[fertility$Year == year, ]
Fer_w <- data.frame(Code = Fer_i$Code, Fertility = Fer_i$Fertility)



resultat_fusion <- merge(marriage2, GDP_w, by="Code", all.x=TRUE)
resultat_fusion <- merge(resultat_fusion, Fer_w, by="Code", all.x=TRUE)

summary(lm(formula = Proportion ~ Islam + GDPc+Fertility, data = resultat_fusion))

summary(lm(formula = Proportion ~ GDPc+Fertility, data = resultat_fusion))