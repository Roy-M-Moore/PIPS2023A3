## Assignment 3.2.R.1 - 2023 Programming in Psychological Science

# Date               Programmer                   Student Number
# ====          ====================            =================
# 27-Jan-2023     Roy Michael Moore                 14137615



###########################################

# This script as well as its README file can be found on:
# https://github.com/Roy-M-Moore/PIPS2023A3

###########################################

# Part 1: remind_me() function
# This function returns the names of famous people that were born on the day you introduce.
# For instance, you could run this function every day and see who was born that day of the year.

remind_me <- function(month, day) {
  if (!require(curl)) {
    stop("curl not installed")
  } else {
   curl_dat <- curl("https://raw.githubusercontent.com/richard512/Little-Big-Data/master/famous-birthdates.csv")
   dat <- read.csv(curl_dat, header = TRUE, sep = " ") # create data frame
   dat <- na.omit(dat) # remove missing values
   my_list <- dat[dat[, 6] == month & dat[, 7] == day, 1] # choose famous people born in the right day and month
   return(my_list)
  }
}

remind_me(month = 05, day = 06) # Freud's birthday

# Who was born on today's date?
remind_me(month = as.POSIXlt(Sys.time())$mon + 1, day = as.POSIXlt(Sys.time())$mday)


# Part 2: cheat() function
# The cheat() function provides the correct answer to some of the exercises in assignment 3.1
# So far, it only has 4 exercises as part of it, but it could be expanded to contain all of assignment 3.1.

cheat <- function(Question = 1) {
  if (Question == 1) {
    grades <- rnorm(60, 7.25, 0.75) # 60 students in the class, average grade of 7.5 and a standard deviation of .75
    hist(grades, xlab = "Grade (out of 10)", main = "Histogram of Exam Grades")
    abline(v = mean(grades), col = "red", lwd = 4, lty = 1) # plot mean value of the data
  } else if (Question == 2) {
    if (!require(curl)) {
      stop("curl not installed")
    } else {
      schiphol_data <- curl("https://raw.githubusercontent.com/hannesrosenbusch/schiphol_class/master/schiphol_data.csv")
      data <- read.csv(schiphol_data)
      head(data)
      plot(x = data$DATE, y = data$TMAX, ylim = c(10.5,16), xlab = "Year", ylab = "Maximum Temperature",
           main = "Temperature at Schiphol Airport Over Time")
    }
  } else if (Question == 3) {
    if (!require(ggplot2)) {
      stop("ggplot2 not installed")
    } else if (!require(titanic)) {
      stop("titanic not installed")
    } else {
      dat <- cbind(titanic_train, "Count" = rep(1, nrow(titanic_train)))
      ggplot(data = dat) +
        geom_col(mapping = aes(x = Sex, y = Count, fill = factor(Survived))) +
        guides(fill=guide_legend("How did it go?"))
    }
  } else if (Question == 4) {
    if (!require(ggplot2)) {
      stop("ggplot2 not installed")
    } else if (!require(gridExtra)) {
      stop("gridExtra not installed")
    } else if (!require(titanic)) {
      stop("titanic not installed")
    } else {
      dat <- cbind(titanic_train, "Count" = rep(1, nrow(titanic_train)))
      p <- ggplot(data = dat) +
        geom_col(mapping = aes(x = Sex, y = Count, fill = factor(Survived))) +
        guides(fill=guide_legend("How did it go?")) + labs(title = "theme_grey")
      p2 <- p + theme_bw() + labs(title = "theme_bw")
      p3 <- p + theme_linedraw() + labs(title = "theme_linedraw")
      p4 <- p + theme_light() + labs(title = "theme_light")
      p5 <- p + theme_dark() + labs(title = "theme_dark")
      p6 <- p + theme_minimal() + labs(title = "theme_minimal")
      p7 <- p + theme_classic() + labs(title = "theme_classic")
      p8 <- p + theme_void() + labs(title = "theme_void")
      grid.arrange(p,p2,p3,p4,p5,p6,p7,p8)
    }
  }
  
}

cheat(1)
