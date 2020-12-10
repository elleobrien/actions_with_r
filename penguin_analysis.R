renv::restore()

library(palmerpenguins)
library(ggplot2)
library(dplyr)

data(package = 'palmerpenguins')

# Look at distribution of bill lengths in 3 species
palette = c("#999999", "#E69F00", "#56B4E9")
theme_set(
  theme_classic(base_size = 7)
)

px <- ggplot(data=penguins, aes(bill_length_mm))+
  geom_histogram(aes(fill=species), alpha=0.6, position="identity")+
  theme_classic()+
  theme(text = element_text(size = 4))+
  xlab("Bill Length (mm)")+
  ylab("Count")+
  ggtitle("Penguin noses")+
  scale_fill_manual("Species",values=palette)
px  
ggsave("my_penguin_plot.png",px, device = "png", width=1.5,height=1)

# Run a linear model
# t <- penguins %>%
#  select(c("species","bill_length_mm","bill_depth_mm","flipper_length_mm","body_mass_g")) %>%
#  aggregate(.~species,.,FUN=mean,na.rm=TRUE) %>%
#  kable() %>%
#  cat(.,file="mymodel.html")

