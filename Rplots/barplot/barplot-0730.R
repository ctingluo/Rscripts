##########################################
#  https://github.com/ctingluo
#  Copyright (C) 2021 Chenting.luo
#  contact: ctingluo@163.com
##########################################


#Basic barplot
# create dummy data
data <- data.frame(
  name=letters[1:5],
  value=sample(seq(4,15),5)
)

# The most basic barplot you can do:
barplot(height=data$value, names=data$name)

# Uniform color
barplot(height=data$value, names=data$name, col=rgb(0.2,0.4,0.6,0.6) )

# Specific color for each bar? Use a well known palette
library(RColorBrewer)
coul <- brewer.pal(5, "Set2") 
barplot(height=data$value, names=data$name, col=coul )

# Change border color
barplot(height=data$value, names=data$name, border="#69b3a2", col="white" )

# Title, Axis label, Custom limits
barplot(height=data$value, names=data$name, 
        col=rgb(0.8,0.1,0.1,0.6),
        xlab="categories", 
        ylab="values", 
        main="My title", 
        ylim=c(0,40)
)


#Horizontal barplot
barplot(height=data$value, names=data$name, 
        col="#69b3a2",
        horiz=T, las=1
)


# Control space:
barplot(height=data$value, names=data$name, col=rgb(0.2,0.4,0.6,0.6), space=c(0.1,0.2,3,1.5,0.3) )

# Control width:
barplot(height=data$value, names=data$name, col=rgb(0.2,0.4,0.6,0.6), width=c(0.1,0.2,3,1.5,0.3) )



#Barplot texture
# create dummy data
data <- data.frame(
  name=letters[1:5],
  value=sample(seq(4,15),5)
)

# barplot
barplot( height=data$value, names=data$name , density=c(5,10,20,30,7) , angle=c(0,45,90,11,36) , col="brown"   )




