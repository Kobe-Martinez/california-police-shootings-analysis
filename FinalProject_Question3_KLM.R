#21:219:220 Fundamentals of Data Visualization, Spring 2021
#Final Project - Question 3
#Kobe Lee Martinez, RUID: 202006380
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

#produces the unique labels for race
races <- sort(unique(killings$race))
#sorting data based on race
white <- killings[killings$race == "W", ]
black <- killings[killings$race == "B", ]
asian <- killings[killings$race == "A", ]
hispanic <- killings[killings$race == "H", ]
unknown <- killings[killings$race == "", ]


#sets the x range for age of victims in most dangerous cities to (10-80)
xrange <- c(10,80)
#bins the range in buckets of 10
bins <- seq(xrange[1], xrange[2],10)
h1 <- hist(white$age, breaks = bins, plot = FALSE)
h2 <- hist(black$age, breaks = bins, plot = FALSE)
h3 <- hist(asian$age, breaks = bins, plot = FALSE)
h4 <- hist(hispanic$age, breaks = bins, plot = FALSE)
h5 <- hist(unknown$age, breaks = bins, plot = FALSE)
#sets the y range for age of victims in most dangerous cities to (0-20)
yrange <- c(0,20)

#I created a pdf file
pdf_file<-"FinalProject_Question3_KLM.pdf"
pdf_file
#using the cairo_pdf & par functions, I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=9,height=8)
par(omi = c(.25,.25,.25,.25))
#creates a matrix of 2 numbers, puts them in 1 cols, and sets them by row 
mat <- matrix(c(1,2), nrow = 2, ncol = 1, byrow = TRUE)
#sets the heights of the cols/rows in the matrix above
layout(mat, heights = c(1,0.5))
#sets the line width and the margin size specified in inches
par(lwd = 2, mai = c(0,1.5,0.5,1.5))

#plots the age of white victims in a histogram by the assigned bins
#sets the y axis limits based on yrange and the x axis limits based on xrange
#names the title of the figure "Age of Victims"
#plots the figure without any axises
hist(white$age, breaks = bins, xlab = "Age of Victims",col = colorsT[1],border = colors[1],
     ylim = yrange, xlim = xrange,
     main = "Age of Victims by Race in the Top 5 Most Dangerous Cities", xaxt = "n",
     yaxt = "n", cex.main = 1.3, ylab = NULL)

#plots the other races in the same histogram by the assigned bins
hist(hispanic$age, breaks = bins, col = colorsT[2], border = colors[2], add = TRUE)
hist(black$age, breaks = bins, col = colorsT[3], border = colors[3], add = TRUE)
hist(asian$age, breaks = bins, col = colorsT[4], border = colors[4], add = TRUE)
hist(unknown$age, breaks = bins, col = colorsT[5], border = colors[5], add = TRUE)

#creates the y-axis for the histogram with tick marks from (0-20) in increments of 5 and size of 0.025,  
#and the axis line 2 times the line width. 
axis(2, at = seq(0,20,5), tck = -(-0.025), lab = F, lwd = 2)
#Produces the numbers for the y-axis (0,20) in increments of 5
mtext(seq(0,20,5), 2, at = seq(0,20,5), las = 2, line = 0.5)
#Labels the y-axis "Frequency"
mtext("Frequency", 2,  line = 1.5, cex = 1.4)

#legend (which is color-blind friendly) so viewers can understand which sex is being represented
legend("topright", col = colorsT[1:5], bty = "n",
       text.font=4, bg='#f7f9fb', cex=1, pch = c(15), pt.cex = 2,
       legend = c("White","Hispanic","Black","Asian","Unknown"))

#######################################
#sets the line width and the margin size specified in inches 
par(lwd = 2, mai = c(0.5,1.5,0,1.5))
#creates a boxplot based on the age and race cols. from killings
#makes sure the boxplot is horizontal
#plots it with no axises, no frame, scale factor of 0.5, 
#and ylim by the xrange of the first histogram
boxplot(age ~ race, data = killings, horizontal = TRUE, 
        boxwex = 0.5, col = colors[5:1], yaxt = "n", xaxt = "n", 
        ann = FALSE, ylim = xrange, outline = TRUE, frame = F)
#creates the x-axis for the boxplot with tick marks from (10,80) in increments of 10 and size of 0.05,  
#and the axis line 2 times the line width.
axis(1, at = seq(10,80,10), tck = -(-0.05), lab = F, lwd = 2)
#Produces the numbers for the x-axis (10,80) in increments of 10
mtext(seq(10,80,10), 1, at = seq(10,80,10), line = 0.2)
#Labels the x-axis "Age of Victims"
mtext("Age of Victims", 1,  line = 1.5, cex = 1.4)

#closes file and provides URL for plot(concates. to single image)
dev.off()