### Galatasaray Transfer Grafiği 

Gelenler<-c("Abdülkerim Bardakçı","Kazımcan\nKarataş",
            "Sergio Oliviera","Haris Seferovic","Leo Dubois",
            "Fredrik Midtsjö","Dries Mertens","Lucas Torreira")
Mevki<-c("Defans","Defans","Orta Saha","Forvet","Defans",
         "Orta Saha","Orta Saha","Orta Saha")

Bonservis<-c(2.8,1.14,3,1,2.5,3.5,0,6)

Yaş<-c(27,19,30,30,27,28,35,26)

df<-data.frame(Gelenler,Mevki,Bonservis,Yaş)

rownames(df)<-Gelenler

head(Gelenler)


library(ggplot2)
library(ggthemes)
library(showtext)
library(ggtext) # Ref: https://cran.r-project.org/web/packages/ggtext/index.html

my_font <- "Roboto Condensed"



font_add_google(name = my_font, family = my_font)

showtext_auto()


title <- "<span style = 'color:#C80000'>Galata</span><span style = 'color:#F5AD09'>saray</span>'ın 2022-23 Sezonu Transfer Stratejisi "
caption <-"Twitter: @OzancanOzdemir|Kaynak: TransferMarkt"
p1<-ggplot(df,aes(x=Yaş,y=Bonservis,color = Mevki,label = rownames(df)))+
  geom_point(size = 5)+geom_text(fontface= "bold", size = 3.5,color="black",vjust = 1,family = my_font)+labs(title = title,caption = caption)+
  scale_color_manual(values = c("darkgreen","red","darkgrey"))+theme_fivethirtyeight()+
  theme(text = element_text(family = my_font))+
  theme(axis.title = element_text(size = 12,face="bold"))+
  theme(axis.text = element_text(size = 10,face ="bold"))+
  theme(legend.text = element_text(size = 10,face="bold"))+
  theme(plot.caption = element_text(face="bold"))+
  theme(legend.title = element_blank())+ 
  theme(plot.title = element_markdown(size = 16, face = "bold"))+
  theme(rect = element_rect(fill ="White"))+ylab('Bonservis(Milyon €)')+
  annotate("text", x = 20, y = 6, label = "Genç&Pahalı",family = my_font,fontface="bold",size=3.5)+
  annotate("text", x = 35, y = 6, label = "Yaşlı&Pahalı",family = my_font,fontface="bold",size=3.5)+
  annotate("text", x = 20, y = 0, label = "Genç&Ucuz",family = my_font,fontface="bold",size=3.5)+
  annotate("text", x = 35, y = 1, label = "Yaşlı&Ucuz",family = my_font,fontface="bold",size=3.5)+
  geom_abline(intercept = 5.8, slope = -0.05, color="black", linetype="dashed", size=.5)+
  geom_abline(intercept = 3.2, slope = -0.05, color="black", linetype="dashed", size=.5)
  

p1
