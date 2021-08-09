##########################################
#  https://github.com/ctingluo
#  Copyright (C) 2021 Chenting.luo
#  contact: ctingluo@163.com
##########################################



#Pie plot 
# Create Data
Prop <- c(3,7,9,1,2)

# Make the default Pie Plot
pie(Prop)
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E"))

# If you give a low value to the "edge" argument, you go from something circular to a shape with edges
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , edges=10)

# The density arguments adds stripes. You can control the angle of this lines with "angle"
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , density=10 , angle=c(20,90,30,10,0))

# Prepare a color palette. Here with R color brewer:
library(RColorBrewer)
myPalette <- brewer.pal(5, "Set2") 

# You can change the border of each area with the classical parameters:
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E"), border="white", col=myPalette )

