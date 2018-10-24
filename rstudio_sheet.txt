# Amirhossein Afshinfard
# a really nice collection of cheatsheets is available here:
# https://www.rstudio.com/resources/cheatsheets/
___________________________________
### Install packages:
source("http://bioconductor.org/biocLite.R")
biocLite("PACKAGE_NAME")
# you may run into dependency error, recursivly keep installing all dependencies.

___________________________________
### reading data into R:
# a summarized cheatsheet:
# https://rstudio-pubs-static.s3.amazonaws.com/1776_dbaebbdbde8d46e693e5cb60c768ba92.html
read.csv()


___________________________________
### - Visualization

## ggplot2 
# a nice online cheatsheet is available here:
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
# but simple commands are:

# >1 data on a single plot:
ggplot(A,aes(x,y)) +geom_point() +geom_point(data=B,colour='red') + xlim(0, 10)
