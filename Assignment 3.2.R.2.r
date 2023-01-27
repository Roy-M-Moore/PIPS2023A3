## Assignment 3.2.R.2 - 2023 Programming in Psychological Science

# Date               Programmer                   Student Number
# ====          ====================            =================
# 27-Jan-2023     Roy Michael Moore                 14137615



###########################################

# This script as well as its README file can be found on:
# https://github.com/Roy-M-Moore/PIPS2023A3

###########################################


# make_art()
# The make_art() function will create random art following striped patterns. It can take three arguments:
## seed: set a seed so that the artwork can be repeated multiple times. Defaults to NULL.
## resolution: how many "patches" should the image have. Defaults to 150.
## colors: a vector of two colors to be specified in the form ' c("color1", "color2") '. Defaults to black and green.

make_art <- function(seed = NULL, resolution = 150, colors = c("black", "green")){
  set.seed(seed)
  n <- resolution # set resolution
  patches <- matrix(sample(c(1,0), size = n^2, replace = T, prob = c(0.5, 0.5)), n, n) # generate canvas
  
  for (i in 1:nrow(patches)) {
    for (j in 1:ncol(patches)) {
      if (j < n) {
        patches[i, j+1] <- sample(c(patches[i, j], patches[i, j+1]), size = 1, prob = c(0.875, 0.125))
      }
    }
  }
  
  par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
  image(patches, col = colors, axes = FALSE)
}

make_art(seed = 2, resolution = 175, colors = c("blue", "pink"))
