##########################################
#  https://github.com/ctingluo
#  Copyright (C) 2021 Chenting.luo
#  contact: ctingluo@163.com
##########################################



#pie plot
par(mfrow = c(2,2))
slices <- c(10, 12, 4, 16, 8)
lbls <- c("us", "uk", "Australia", "Germany", "France")

pie (slices, labels = lbls,
     main = "Simple Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, "", pct, "%", sep = "")
pie(slices, labels = lbls2, col = rainbow(length(lbls2)),
    main = "Pie Chart with Percentages")

#install.packages("plotrix")
library(plotrix)
pie3D(slices, labels = lbls, explode = 0.1,
      main = "3D pie Chart")

mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep = "")
pie(mytable, labels = lbls3, 
    main = "Pie Chart from a Table\n (with sample sizes)" )


