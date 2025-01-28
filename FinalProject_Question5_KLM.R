#21:219:220 Fundamentals of Data Visualization, Spring 2021
#Final Project - Question 5
#Kobe Lee Martinez, RUID: 202006380
#importing packages
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
poverty <- read.csv("PercentagePeopleBelowPovertyLevel.csv")

#setting the state to California
poverty <- poverty[poverty$Geographic.Area == "CA", ]
#setting the cities to the one with the most police shootings
poverty <- poverty[poverty$City %in% c("Los Angeles city","Bakersfield city","Fresno city","San Francisco city","San Jose city"), ]

#removing NA values
poverty <- na.omit(poverty)

#turning the data type of poverty rates to numerical
poverty$poverty_rate <- as.numeric(poverty$poverty_rate)


#created a pdf file
pdf_file<-"FinalProject_Question5_KLM.pdf"
pdf_file
#using the cairo_pdf & par functions, I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=11,height=8)
par(omi = c(.25,.25,.25,.25), mar=c(7, 7, 7, 7), lwd = 2)

#bar chart displaying the poverty rates of the most dangerous cities in California 
barplot(poverty$poverty_rate, space = c(0.8,0.8,0.8,0.8,0.8), main = "Poverty Rates of the Top 5 Most Dangerous Cities", names.arg = c("Bakersfield","Fresno","Los Angeles","San Francisco","San Jose"), 
        xlab = "Poverty Rates", ylab = "Cities", col = colorsT[1:5], border = colors[1:5],  horiz=TRUE, xlim = c(0,40), cex.main=1.5, cex.lab=1.4, cex.names = 0.82, axes = FALSE)

#creates the x-axis from 0-40 in increments of 10
axis(1, at = seq(0,40,10), tck = 0.01, lab = F, lwd = 2)
#plots the actual numbers for the x-axis from (0-40) in increments of 10
mtext(seq(0,40,10), 1, at = seq(0,40,10), line = 0.8, las = 1)
#legend (which is color-blind friendly) so viewers can understand that each bar
#reps. a different city
legend("topright", col = colorsT[1:5], 
       text.font=4, bg='#f7f9fb', cex=1, pch = c(15), pt.cex = 2,
       legend = c("Bakersfield","Fresno","Los Angeles","San Francisco","San Jose"), bty="n")


#closes file and provides URL for plot(concates. to single image)
dev.off()