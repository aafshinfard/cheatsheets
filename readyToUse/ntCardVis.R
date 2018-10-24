library(ggplot2)
read.csv()
head1 =
  read.table("PATH/TO/FILE.hist", sep = "\t", nrows = 2,header = FALSE)
hist1 = 
  read.table("PATH/TO/FILE.hist", sep = "\t", skip = 2, header = FALSE)
head1
head(hist1)

# head2 =
#   read.table("PATH/TO/FILE2.hist", sep = "\t", nrows = 2,header = FALSE)
# hist2 = 
#   read.table("PATH/TO/FILE2.hist", sep = "\t", skip = 2, header = FALSE)
# head2
# head(hist2)

# Vis
ggplot(data = hist10M, aes(x = V1)) +
  geom_line(aes(y = hist10M[,2], colour = "1st data")) +
  # geom_line(aes(y = hist2[,2], colour = "2nd data")) +
  # geom_line(aes(y = hist3[,2], colour = "3rd data")) +
  scale_colour_manual("", 
                      breaks = c("1st data"),
                      # breaks = c("1st data", "2nd data", "3rd data"),
                      values = c("blue")) +
                      # values = c("red", "green", "blue")) +
  ylim(0,20000) + xlim(0,320)


# What to add? Automatic trimming!
