#Importing libraries
library(GISTools)
library(Cairo)
library(RColorBrewer)
#Importing color palette from set 2 with all colors in pal.
colors <- brewer.pal(8, "Set2")
colorsT <- add.alpha(colors, .5)

#sets the working directory
setwd("/Users/kobea/OneDrive/Documents/Rutgers/FDMTLS of Data Vis/coding/Final Project")
#lists all the files in the directory
list.files()
#importing csv file from wd
killings <- read.csv("PoliceKillingsUS.csv")
#setting the state to California
killings <- killings[killings$state == "CA", ]
#setting the cities to the one with the most police shootings
killings <- killings[killings$city %in% c("Los Angeles","Bakersfield","Fresno","San Francisco","San Jose"), ]
#removing NA values
killings <- na.omit(killings)
#indexing the 8 & 9 column in the data set
vals <- killings[,c(8,9)]
#putting the values from the 8th and 9th col. into a table
table(vals)

#I created a pdf file 
pdf_file<-"FinalProject_Question6_KLM.pdf"
pdf_file
#using the cairo_pdf function I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=11,height=8)
par(mar=c(7, 7, 4, 4))
#bar graph of the death of each race by the cities with the most killings
barplot(table(vals), main = "Distribution of Deaths by Race in the Top 5 Cities", xlab = "Cities",
        ylab = "Deaths", col = colorsT[1:5], border = colors[1:5],
        las = 1, ylim = c(0,40), cex.main=1.7, cex.lab=1.4, axes = FALSE)
#creates the y-axis from 0-40 in increments of 10
axis(2, at = seq(0,40,10), tck = 0.01, lab = F, lwd = 2)
#plots the actual numbers for the y-axis from (0-40) in increments of 10
mtext(seq(0,40,10), 2, at = seq(0,40,10), line = 0.8, las = 2)
#legend (which is color-blind friendly) so viewers can understand that each bar
#reps. a different age group
legend("topright", col = colorsT[1:5], 
       text.font=4, bg='#f7f9fb', cex=1, pch = c(15), pt.cex = 2,
       legend = c("Unknown","Asian","Black","Hispanic","White"), bty="n")


#closes file and provides URL for plot(concates. to single image)
dev.off()
