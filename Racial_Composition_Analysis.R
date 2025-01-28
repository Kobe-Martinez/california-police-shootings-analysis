#Importing libraries
library(GISTools)
library(Cairo)
library(RColorBrewer)
#Importing color palette from set 2 with all colors in pal.
colors <- brewer.pal(8, "Set2")
colorsT <- add.alpha(colors, .5)

#3.1
#sets the working directory
setwd("/Users/kobea/OneDrive/Documents/Rutgers/FDMTLS of Data Vis/coding/Final Project")
#lists all the files in the directory
list.files()
#importing csv file from wd
race <- read.csv("ShareRaceByCity.csv")

#setting the state to California
race <- race[race$Geographic.area == "CA", ]
#removing NA values
race <- na.omit(race)
#setting the cities to the one with the most police shootings
race <- race[race$City %in% c("Los Angeles city","Bakersfield city","Fresno city","San Francisco city","San Jose city"), ]

#turning the data type to numerical
race$share_white <- as.numeric(race$share_white)
race$share_black <- as.numeric(race$share_black)
race$share_native_american <- as.numeric(race$share_native_american)
race$share_asian <- as.numeric(race$share_asian)
race$share_hispanic <- as.numeric(race$share_hispanic)
#combining the data by rows
Rat1 <- rbind(race$share_white,race$share_black,race$share_native_american,race$share_asian,race$share_hispanic)


#I created a pdf file 
pdf_file<-"FinalProject_Question1_KLM.pdf"
pdf_file
#using the cairo_pdf function I edited the dimensions of the 
#pdf file
cairo_pdf(pdf_file,width=20,height=9.35)
#using the par(), I increased the
#size of the graphs and placed them in 1 row/1 col
par(mfrow=c(1,1), mar=c(7, 5, 4, 1))

#bar graph that plots the share of races by city with the most shootings
barplot(Rat1, main = "Top 5 Cities in California by Race %", names.arg = race$City, xlab = "Cities",
                    ylab = "Percentage %", col = colorsT[1:5], border = colors[1:5],
                    las = 1, beside = TRUE, space = c(.1,2), ylim = c(0,100), cex.main=1.7, cex.lab=1.4, axes = FALSE)

axis(2, at = seq(0,100,10), tck = -0.01, lab = F, lwd = 2)
#plots the actual numbers for the y-axis from (0-100) in increments of 10
mtext(seq(0,100,10), 2, at = seq(0,100,10), line = 0.8, las = 2)
#legend (which is color-blind friendly) so viewers can understand that each bar
#reps. a different age group
legend("topright", col = colorsT[1:5], 
       text.font=4, bg='#f7f9fb', cex=1, pch = c(15), pt.cex = 2,
       legend = c("White","Black","Native American","Asian","Hispanic"), bty="n")

#closes file and provides URL for plot(concates. to single image)
dev.off()
