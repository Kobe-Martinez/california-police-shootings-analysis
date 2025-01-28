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
graduated <- read.csv("PercentOver25CompletedHighSchool.csv")
poverty <- read.csv("PercentagePeopleBelowPovertyLevel.csv")

#setting the state to California
graduated <- graduated[graduated$Geographic.Area == "CA", ]
poverty <- poverty[poverty$Geographic.Area == "CA", ]
#removing NA values
graduated <- na.omit(graduated)
poverty <- na.omit(poverty)
#turning the data type to numerical
graduated$percent_completed_hs <- as.numeric(graduated$percent_completed_hs)
poverty$poverty_rate <- as.numeric(poverty$poverty_rate)
#removing NA values
graduated <- na.omit(graduated)
poverty <- na.omit(poverty)

#setting the x and y-lim using the pretty function
ylim <- range(pretty(poverty$poverty_rate))
xlim <- range(pretty(graduated$percent_completed_hs))

#I created a pdf file 
pdf_file<-"FinalProject_Question2_KLM.pdf"
pdf_file
#using the cairo_pdf & par functions, I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=11,height=7.5)
par(omi = c(.25,.25,.25,.25))
#sets the line width and the margin size specified in inches
par(lwd = 2, mai = c(0.5,0.5,0.5,0.5))

#empty plot with specified ranges
plot(x = NULL, y=NULL, xlim=xlim, ylim=ylim, axes=FALSE, ann=FALSE)
#plots the points of graduation rates by poverty rates in the shapes of empty circles
points(graduated$percent_completed_hs, poverty$poverty_rate, pch = 21, cex = 4, col = colors[3])
#creates the axis for the plot
axis(1, tck = 0.01, lwd = 2, at = pretty(graduated$percent_completed_hs),lab = F)
axis(2, tck = 0.01, lwd = 2, at = pretty(poverty$poverty_rate),lab = F)
axis(3, tck = 0.01, lwd = 2, at = pretty(graduated$percent_completed_hs),lab = F)
axis(4, tck = 0.01, lwd = 2, at = pretty(poverty$poverty_rate),lab = F)
#Produces the numbers for the y-axis by the range of col. poverty rate
mtext(pretty(poverty$poverty_rate), 2, at = pretty(poverty$poverty_rate), line = 0.2, las = 1)
#Produces the numbers for the x-axis by the range of col. percent completed high school
mtext(pretty(graduated$percent_completed_hs), 1, at = pretty(graduated$percent_completed_hs), line = 0.5, las = 1)
#x-axis label
mtext("Graduation Rates",1,line = 1.5, cex = 1.2)
#y-axis label
mtext("Poverty Rates",2, line = 1.5, cex = 1.2)
#Title label
mtext("Correlation Between Poverty Rates and Graduation Rates in California",3, line = 1.5, cex = 1.5)
#closes the gaps between the axises and makes the graph appear as a box
box(lwd=2)
#adds one or more straight lines through the current plot
abline(lm(poverty$poverty_rate ~ graduated$percent_completed_hs), col=colors[8],lwd = 4)
#returns the pearson r number which appears on the graph as r = " "
grad <- cor(graduated$percent_completed_hs, poverty$poverty_rate, method ="pearson")
#placement for where the pearson r will be placed
text(xlim[1],ylim[2], paste0("r = ",round(grad,3)), adj = 0, cex = 1.5)
#closes file and provides URL for plot(concates. to single image)
dev.off()
