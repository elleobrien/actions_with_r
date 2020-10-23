
install.packages("palmerpenguins",repos = "http://cran.us.r-project.org")
print("Penguins are here")
install.packages("kableExtra",repos = "http://cran.us.r-project.org", dependencies=TRUE)
print("Kables are here")
install.packages("broom",repos = "http://cran.us.r-project.org")
print("broom is here")
install.packages("ggplot2",repos = "http://cran.us.r-project.org")
print("ggplots are here")


library(palmerpenguins)
library(ggplot2)
library(kableExtra)
library(broom)


data(package = 'palmerpenguins')


# Look at distribution of bill lengths in 3 species
palette = c("#999999", "#E69F00", "#56B4E9")
theme_set(
  theme_classic(base_size = 25)
)

px <- ggplot(data=penguins, aes(bill_length_mm))+
  geom_histogram(aes(fill=species), alpha=0.6, position="identity")+
  theme_classic()+
  xlab("Bill Length (mm)")+
  ylab("Count")+
  ggtitle("Penguins noses")+
  scale_fill_manual("Species",values=palette)
px  
ggsave("my_penguin_plot.png",px, device = "png", width=4,height=4)

# Run a linear model
model <- lm(bill_length_mm ~ 1 + species, data = penguins) %>%
  tidy() %>%
  kable() %>%
  cat(.,file="mymodel.html")
