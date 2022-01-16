library(palmerpenguins)
library(ggplot2)
library(dplyr)
library(kableExtra)


data(package = 'palmerpenguins')

id <- "1Ut38XjBahKE7ess-Dgm0202PaHZNbcD7" 
new <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export=download", id))
penguins <- rbind(penguins, new)

# Look at distribution of bill lengths in each species
palette = c("#999999", "#E69F00", "#56B4E9", "#643A71")
theme_set(
  theme_classic(base_size = 7)
)

px <- ggplot(data=penguins, aes(bill_length_mm))+
  geom_histogram(aes(fill=species), alpha=0.6, position="identity")+
  theme_classic()+
  theme(text = element_text(size = 5),
        legend.key.size = unit(.3,"cm"))+
  xlab("Bill Length (mm)")+
  ylab("Count")+
  ggtitle("Penguin noses")+
  scale_fill_manual("Species",values=palette)
px  
ggsave("my_penguin_plot.png",px, device = "png", width=3,height=1.5,dpi=300)

# Report average measures of beak/body size per species
t <- penguins %>%
  select(c("species","bill_length_mm","bill_depth_mm","flipper_length_mm","body_mass_g")) %>%
  aggregate(.~species,.,FUN=mean,na.rm=TRUE) %>%
  kable() %>%
  cat(.,file="mymodel.html")
  
