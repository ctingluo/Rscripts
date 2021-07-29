##########################################
#  https://github.com/ctingluo
#  Copyright (C) 2021 Chenting.luo
#  contact: ctingluo@163.com
##########################################

#load packages

library(ggplot2)

# read data file 


#第一个图ggplot2绘制平滑曲线的折线图
#R语言ggplot2包用来画折线图的函数默认应该是带有棱角的
#平滑的可以借助 geom_bump()函数 来自于ggbump这个R包

df <- data.frame(x=1:10,
               y=sample(1:10,10))
ggplot(df) +
  geom_line(aes(x,y))+
  geom_point(aes(x,y))

#install.packages("ggbump")
library(ggbump)
library(ggplot2)
#dplyr一个快速、一致的工具用于处理像对象一样的数据帧无论是在内存中还是内存外
library(dplyr)
#sample随机样本和排列
df <- data.frame(x=1:10,
               y=sample(1:10,10))
ggplot(df) +
  geom_bump(aes(x,y))+
  geom_point(aes(x,y))

#第二个图ggplot2绘制带配对样本连线的箱线图
#箱线图


#boxplot 
setwd("D:\\Chenting\\Plots\\boxplot-demo")

setwd("D:\\Chenting\\Rdemo\\07~08\\0728")
getwd()
list.files()
dat1 <- read.delim('gene_express.txt')
#使用 ggplot2 绘制配对样本的箱线图
library(ggplot2)

p1 <- ggplot(dat1, aes(x = group1, y = MAP2)) +
  geom_boxplot(aes(fill = group1), show.legend = FALSE, width = 0.6) +  #绘制箱线图展示肿瘤组织和正常组织的两组基因表达整体分布
  geom_point() +  #绘制散点表示单个样本的基因表达信息
  geom_line(aes(group = group2), color = 'gray', lwd = 0.35) +  #绘制样本连线，通过 aes(group) 参数指定配对样本信息
  scale_fill_manual(values = c('#FE7280', '#AC88FF')) +  #以下是颜色分配、主题更改等，不再多说
  theme(panel.grid = element_blank(), axis.line = element_line(colour = 'black'), panel.background = element_blank(), 
        axis.text = element_text(size = 9, color = 'black'), axis.title = element_text(size = 10, color = 'black')) +
  labs(x = '', y = 'expression of MAP2 \n')


#save figures 


pdf("boxplot.pdf",width = 10,height = 10)
p1
dev.off()

png("boxplot.png",width = 1000,height = 800)
p1
dev.off()

#添加显著性统计
#例如这里使用了配对样本的 t 检验来比较基因 MAP2 在肿瘤组织和正常组织中的表达差异情况
#实际情况中，也可能会用到其它类型的统计检验方法，阅读文献时注意下即可

#为了防止配对样本信息错乱，先构造一个配对样本的数据集
dat1_paried <- reshape2::dcast(dat1[c('group1', 'group2', 'MAP2')], group2~group1)
head(dat1_paried)

#配对 t 检验，双侧检验
t_test <- t.test(dat1_paried$Tumor, dat1_paried$Normal, paired = TRUE, alternative = 'two.sided', conf.level = 0.95)
t_test

#将 p 值添加在箱线图中
p1 + 
  annotate('text', label = 'Paired Samples t Test\nTumor vs Normal: P = 0.003', x = 1, y = 4, size = 3)











