
options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/__linux__/centos7/352"))
install.packages("renv")

renv::restore()

library(MASS)
head(Boston)

