library(ggplot2)
##############################################################################
############# single - patterm (skip to next chapters for more!)

addr1 = "PATH/TO/FILE.hist"
head1 =
  read.table(addr1, sep = "\t", nrows = 2,header = FALSE)
hist1 = 
  read.table(addr1, sep = "\t", skip = 2, header = FALSE)
head1
head(hist1)

# head2 =
#   read.table("PATH/TO/FILE2.hist", sep = "\t", nrows = 2,header = FALSE)
# hist2 = 
#   read.table("PATH/TO/FILE2.hist", sep = "\t", skip = 2, header = FALSE)
# head2
# head(hist2)
# Vis
#names(hist1) = c("k-mer size", "Count")
y = hist1[,2]
x = hist1[,1]
peakx <- x[which(diff(sign(diff(y)))==-2)]
plot1 = ggplot(data = hist1, aes(x = hist1[,1])) +
  geom_line(aes(y = hist1[,2], colour = "All reads")) +
  # geom_line(aes(y = hist2[,2], colour = "2nd data")) +
  # geom_line(aes(y = hist3[,2], colour = "3rd data")) +
  scale_colour_manual("", 
                      breaks = c("All reads"),
                      # breaks = c("1st data", "2nd data", "3rd data"),
                      values = c("blue")) +
                      # values = c("red", "green", "blue")) +
  ylim(0,500000000) + xlim(0,100) + xlab(label = "repeats") + ylab(label = "Number of k-mers") + 
  annotate(geom= "text", color = "red" , x=peakx[1]+1, y=hist1[peakx[1]+1,2], label = peakx[1]+1)
plot1

# What to add? Automatic trimming!
library(ggplot2)

##############################################################################
############# Different Libraries (3 - comparison)

add10X = "/x.hist"
head10X =
  read.table(add10X, sep = "\t", nrows = 2,header = FALSE)
hist10X = 
  read.table(add10X, sep = "\t", skip = 2, header = FALSE)
head10X
hist10X
head(hist10X)

addLinear = "/x.hist"
headLinear =
  read.table(addLinear, sep = "\t", nrows = 2,header = FALSE)
histLinear = 
  read.table(addLinear, sep = "\t", skip = 2, header = FALSE)
headLinear
histLinear
head(histLinear)

addMatepair = "/x.hist"
headMatepair =
  read.table(addMatepair, sep = "\t", nrows = 2,header = FALSE)
histMatepair = 
  read.table(addMatepair, sep = "\t", skip = 2, header = FALSE)
headMatepair
histMatepair
head(histMatepair)

y = hist10X[,2]
x = hist10X[,1]
peakx10X <- x[which(diff(sign(diff(y)))==-2)]

y = histLinear[,2]
x = histLinear[,1]
peakxLinear <- x[which(diff(sign(diff(y)))==-2)]

y = histMatepair[,2]
x = histMatepair[,1]
peakxMatepair <- x[which(diff(sign(diff(y)))==-2)]

# Vis 2 - 1 channel only

plot1 = ggplot(data = hist10X, aes(x = hist10X[,1])) +
  geom_line(aes(y = hist10X[,2], colour = "The whole data")) +
  scale_colour_manual("", 
                      breaks = c("The whole data"),
                      values = c("blue")) +
  ylim(0,500000000) + xlim(0,100) + xlab(label = "repeats") + ylab(label = "Number of k-mers") + 
  annotate(geom= "text", color = "red" , x=peakx[1]+1, y=hist1[peakx[1]+1,2], label = peakx[1]+1)
plot1

# Vis 2 - 3 channel only
#names(hist10X) = c("k-mer size", "Count")
plot3 = ggplot(data = hist10X, aes(x = V1)) +
  geom_line(aes(y = hist10X[,2], colour = "10X")) +
  geom_line(aes(y = histLinear[,2], colour = "Linear")) +
  geom_line(aes(y = histMatepair[,2], colour = "Matepair")) +
  scale_colour_manual("", 
                      breaks = c("10X", "Linear", "Matepair"),
                      values = c("red", "green", "blue")) +
  ylim(0,10000000000) + ggtitle("the whole reads - ntCard results") + xlim(0,100) +
  labs(x= "repeats",y= "Number of k-mers", colour = "Cylinders", shape="Transmission") + 
  theme(text = element_text(size=16),
        axis.text.x = element_text(angle=0, hjust=1)) +
  annotate(geom= "text", color = "red" , x=peakx10X[1]+1, y=hist10X[peakx10X[1]+1,2], label = peakx10X[1]+1) +
  annotate(geom= "text", color = "green" , x=peakxLinear[1]+1, y=histLinear[peakxLinear[1]+1,2], label = peakxLinear[1]+1) +
  annotate(geom= "text", color = "blue" , x=peakxMatepair[1]+1, y=histMatepair[peakxMatepair[1]+1,2], label = peakxMatepair[1]+1) 
plot3


##############################################################################
############# Different Ks for a Library (3 - comparison)

addk64 = "/x.hist"
headk64 =
  read.table(addk64, sep = "\t", nrows = 2,header = FALSE)
histk64 = 
  read.table(addk64, sep = "\t", skip = 2, header = FALSE)
headk64
histk64
head(histk64)

addk80 = "/x.hist"
headk80 =
  read.table(addk80, sep = "\t", nrows = 2,header = FALSE)
histk80 = 
  read.table(addk80, sep = "\t", skip = 2, header = FALSE)
headk80
histk80
head(histk80)

addk96 = "/x.hist"
headk96 =
  read.table(addk96, sep = "\t", nrows = 2,header = FALSE)
histk96 = 
  read.table(addk96, sep = "\t", skip = 2, header = FALSE)
headk96
histk96
head(histk96)

addk112 = "/x.hist"
headk112 =
  read.table(addk112, sep = "\t", nrows = 2,header = FALSE)
histk112 = 
  read.table(addk112, sep = "\t", skip = 2, header = FALSE)
headk112
histk112
head(histk112)

addk128 = "/x.hist"
headk128 =
  read.table(addk128, sep = "\t", nrows = 2,header = FALSE)
histk128 = 
  read.table(addk128, sep = "\t", skip = 2, header = FALSE)
headk128
histk128
head(histk128)

y = histk64[,2]
x = histk64[,1]
peakxk64 <- x[which(diff(sign(diff(y)))==-2)]

y = histk80[,2]
x = histk80[,1]
peakxk80 <- x[which(diff(sign(diff(y)))==-2)]

y = histk96[,2]
x = histk96[,1]
peakxk96 <- x[which(diff(sign(diff(y)))==-2)]

y = histk112[,2]
x = histk112[,1]
peakxk112 <- x[which(diff(sign(diff(y)))==-2)]

y = histk128[,2]
x = histk128[,1]
peakxk128 <- x[which(diff(sign(diff(y)))==-2)]

plot5 = ggplot(data = histk64, aes(x = V1)) +
  geom_line(aes(y = histk64[,2], colour = "k=64")) +
  geom_line(aes(y = histk80[,2], colour = "k=80")) +
  geom_line(aes(y = histk96[,2], colour = "k=96")) +
  geom_line(aes(y = histk112[,2], colour = "k=112")) +
  geom_line(aes(y = histk128[,2], colour = "k=128")) +
  scale_colour_manual("", 
                      breaks = c("k=64","k=80","k=96", "k=112", "k=128"),
                      values = c("red", "green", "blue","cyan","yellow")) +
  ylim(0,10000000) + ggtitle("the whole 10X reads - ntCard results") + xlim(0,100) +
  labs(x= "repeats",y= "Number of k-mers", colour = "Cylinders", shape="Transmission") + 
  theme(text = element_text(size=16),
        axis.text.x = element_text(angle=0, hjust=1)) +
  annotate(geom= "text", color = "yellow"  , x=peakxk64[1]+1, y=histk64[peakxk64[1]+1,2], label = peakxk64[1]+1) +
  annotate(geom= "text", color = "blue"  , x=peakxk80[1]+1, y=histk80[peakxk80[1]+1,2], label = peakxk80[1]+1) +
  annotate(geom= "text", color = "red"   , x=peakxk96[1]+1, y=histk96[peakxk96[1]+1,2], label = peakxk96[1]+1) +
  annotate(geom= "text", color = "green" , x=peakxk112[1]+1, y=histk112[peakxk112[1]+1,2], label = peakxk112[1]+1) + 
  annotate(geom= "text", color = "cyan" , x=peakxk128[1]+1, y=histk128[peakxk128[1]+1,2], label = peakxk128[1]+1)
plot5

# subs_plot = subs_plot + scale_fill_discrete(breaks=c("10M readpairs","5M readpairs","2.5M readpairs"))
