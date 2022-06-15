library(ggplot2)

my_table <- read.table("output.txt", header = TRUE)


p <- ggplot(subset(my_table, cover==1) ,aes(x=pos,y=reorder(Gene, -index),fill = reorder(Gene, index)))
p <-p + facet_grid(rows = vars(factor(TF,levels = c("SGSS","MAX","SP1","CTCF","YY1","TCF7L2","ZBTB33","FOSL1","JUND","CEBPB","EGR1","USF1","ATF3","SRF","TEAD4"))))
p + geom_tile( ) +
  labs(x ="position", y= "gene", fill = "gene") 

p2 <- ggplot(subset(my_table, cover==1) ,
             aes(x=pos,
                 y=reorder(TF,cover, FUN = sum),
                 fill = factor(TF, levels = c("SGSS","MAX","SP1","CTCF","YY1","TCF7L2","ZBTB33","FOSL1","JUND","CEBPB","EGR1","USF1","ATF3","SRF","TEAD4"))
             ))
            
p2 <-p2 + facet_grid(rows = vars(reorder(Gene, index)))
p2+ geom_tile() + 
    labs(x ="position", y= "TF", fill = "TF")+ 
    guides(fill = guide_legend(reverse=FALSE)) 

