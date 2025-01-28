#21:219:220 Fundamentals of Data Visualization, Spring 2021
#Final Project - Question 4
#Kobe Lee Martinez, RUID: 202006380

#Importing libraries
library(RColorBrewer)
library(Cairo)
library(GISTools)
#Importing color palette from set 2 with all colors in pal.
#gave the color pal. an alpha level of 0.5
colors <- brewer.pal(8, "Set2")
colorsT <- add.alpha(colors, .5)

#sets the working directory
setwd("/Users/kobea/OneDrive/Documents/Rutgers/FDMTLS of Data Vis/coding/Final Project")
#lists all the files in the directory
list.files()
#importing csv file from wd
income <- read.csv("MedianHouseholdIncome2015.csv")

#setting the state to California
income <- income[income$Geographic.Area == "CA", ]
#setting the cities to the one with the most police shootings
income <- income[income$City %in% c("Los Angeles city","Bakersfield city","Fresno city","San Francisco city","San Jose city"), ]
#removing NA values
income <- na.omit(income)

#I created a pdf file 
pdf_file<-"FinalProject_Question4_KLM.pdf"
pdf_file
#using the cairo_pdf & par functions, I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=20,height=6)
par(xpd = TRUE, mar = c(5,15,0.05,4))
#empty plot with specified ranges
plot(x = NULL, y = NULL, ann = FALSE, axes = FALSE,
     xlim = c(30000,90000), ylim = c(1,5))


#plots the points of the median household incomes from ranges (1.5-2.1) in the shapes of circles
points(income$Median.Income,c(1.5,1.7,1.9,2.1,2.3), col = colors[1:5], cex = 4,
       pch = 19)
#creates the x-axis for the figure with tick marks in increments of 10000 and size of 0.01,  
#and the axis line 3 times the line width. 
axis(1, at = seq(30000,90000,10000), tck = -(-0.01), lab = F, lwd = 3, las = 1)
#plots the actual numbers for the x-axis from (30000,90000) in increments of 10000
mtext(seq(30000,90000,10000), 1, at = seq(30000,90000,10000), line = 0.6, cex = 1.5)
#plots the label "Income ($)" under the x-axis 
mtext("Income ($)", 1,  line = 2.4, cex = 2)
#Plots the labels of the cities on the y-axis horizontally from (1.5-2.1) in increments of 0.2 
mtext(c("Bakersfield", "Fresno", "Los Angeles", "San Francisco", "San Jose"), 
      2, line = -1.5, cex = 1.8, las = 1, at = seq(1.5,2.3,.2))
#Plots the title for the figure above the graph
mtext("Median Household Income of the Top 5 Cities in California", 3, line = -8.5, cex = 3.4)



#closes file and provides URL for plot(concates. to single image)
dev.off()