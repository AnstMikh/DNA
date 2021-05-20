library('tidyverse')
library("ggplot2")
library("readr")
pca <- read_table2("./pca.txt")
# pca is not file after plink pca, you should change 1st column --> population names, not sample names
eigenval <- scan("./l_ddata.eigenval")
pca <- pca[,-22]
# set names
# set names
names(pca)[1] <- "ind"
names(pca)[2:ncol(pca)] <- paste0("PC", 1:(ncol(pca)-1))
# sort out the individual species and pops
# spp
spp <- rep(NA, length(pca$ind))
spp[grep("Yoruba", pca$ind)] <- "Yoruba"
spp[grep("Mapuche", pca$ind)] <- "Mapuche"
spp[grep("Huilliche", pca$ind)] <- "Huilliche"
spp[grep("Conchali", pca$ind)] <- "Conchali"
spp[grep("LosRieles", pca$ind)] <- "LosRieles"
spp[grep("SMP", pca$ind)] <- "SMP"
spp[grep("Kaillachuro", pca$ind)] <- "Kaillachuro"
spp[grep("RioUncallane", pca$ind)] <- "RioUncallane"
spp[grep("Cusco", pca$ind)] <- "Cusco"
spp[grep("Tiwanaku", pca$ind)] <- "Tiwanaku"
spp[grep("Miraflores", pca$ind)] <- "Miraflores"
spp[grep("Aconcagua", pca$ind)] <- "Aconcagua"
spp[grep("Iberian", pca$ind)] <- "Iberian"

loc <- rep(NA, length(pca$ind))
loc[grep("Mapuche", pca$ind)] <- "Huapi Island"
loc[grep("Aconcagua", pca$ind)] <- "Cerro Aconcagua"
loc[grep("Cusco", pca$ind)] <- "Torontoy"
loc[grep("RioUncallane", pca$ind)] <- "Rio Ilave Basin"
loc[grep("Yoruba", pca$ind)] <- "Nigeria"
loc[grep("Iberian", pca$ind)] <- "Peninsula"
loc[grep("Kaillachuro", pca$ind)] <- "La Paz"
loc[grep("SMP", pca$ind)] <- "La Paz"
loc[grep("Cusco", pca$ind)] <- "Torontoy"
loc[grep("Tiwanaku", pca$ind)] <- "Bolivia"
loc[grep("Miraflores", pca$ind)] <- "Rio Ilave Basin"
loc[grep("Conchali", pca$ind)] <- "Conchalí"
loc[grep("LosRieles", pca$ind)] <- "Los Rieles"
loc[grep("Huilliche", pca$ind)] <- "North Patagonia"

spp_loc <- paste0(spp, "_", loc)

pca <- as.tibble(data.frame(pca, spp, loc, spp_loc))

pve <- data.frame(PC = 1:4, pve = eigenval/sum(eigenval)*100)
a <- ggplot(pve, aes(PC, pve)) + geom_bar(stat = "identity")
a + ylab("Percentage variance explained") + theme_light()
cumsum(pve$pve)


# plot pca
b <- ggplot(pca, aes(PC1, PC2, col = spp)) + geom_point(size = 2) + scale_shape_manual(values=seq(0,20)) + coord_cartesian()
b <- b + scale_colour_manual(values = c("red", "blue", "yellow", "green", "black", "purple", "orange", "brown", "pink", "goldenrod", "salmon", "orchid", "navy"))
b <- b + coord_cartesian() + theme_light()
#b <- b  + theme_light()
b + xlab(paste0("PC1")) + ylab(paste0("PC2"))
