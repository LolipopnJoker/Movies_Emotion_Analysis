#' @title Emotion Analysis
#' @author Yoav Weller
#' @source https://www.kaggle.com/sanjeetsinghnaik/top-1000-highest-grossing-movies
#' @description Analyzing information about the top 1000 highest grossing Hollywood films. 
#' It is up to date as of 10th January 2022.
#' @details This data has been scraped from multiple site and has been added together
#' for performing various data operations. The data has been taken from IMDB,
#' rotten tomatoes and many other sites.

# Imports ------------------------------------------

## importing libraries -----------------------------
libraries_to_import <- c("tidyverse", "tm", "syuzhet", "srt", "glue", "corrplot", "psych") # Creating a list with all the libraries names

lapply(libraries_to_import, require, character.only = TRUE) # Last argument is used because the names of the libraries are strings

## importing data ----------------------------------
DB  <- read.csv(file.choose(), row.names = 1) # Importing the data.
                                              # The first column is
                                              # row indexes, therefor
                                              # the argument row.names
                                              # is needed.

DB$Subtitles <- NA # Adding an empty column to store all the subtitles.

number_of_subtitles_files <- length(DB$Title)

adding_subtitles <- function(){
  #' Adding the subtitles files to the data frame
  #' 
  #' @return A data frame with the subtitles of all the movies.
  #' 
  
  progress_bar <- txtProgressBar(min = 0,
                                 max = number_of_subtitles_files,
                                 style = 3,
                                 width = 50,
                                 char = "=") # Creating a progress bar
  
  for (i in 1:number_of_subtitles_files){
    # Using the try function in order to make the loop run even if an STR file isn't valid.
    try({
      subtitle_path <- glue('G:/My Drive/Movies_Emotion_Analysis/subtitles/{i}.srt') # Path to the SRT file in position i
      subtitle <- suppressWarnings(t(read_srt(subtitle_path))) # Importing the SRT file in position i in a vertical matrix
      subtitle <- as.data.frame(subtitle) # Turning it into a data frame
      subtitle <- unite(subtitle, col = "subtitles", 1:ncol(subtitle), remove = TRUE, sep = " ") # Turning the matrix to 1X1
      DB$Subtitles[i] <- subtitle$subtitle[4] # Inserting the subtitles into the main data-set 
      setTxtProgressBar(progress_bar, i) # Updating progress bar
    },
    silent = TRUE) # If wasn't successful, ignore
  } 

  close(progress_bar) # Closing progress bar
  
  .GlobalEnv$DB <- DB # Returning the dataframe to the global environment.
  
  sum(is.na(DB$Subtitles)) # Counting the amount of NA's in the Subtitles column. Ideally, it would be equal to none.
  
}

adding_subtitles()

# Data Cleaning ------------------------------------

# Splitting the date column
DB <- separate(DB, Release.Date, c("release.month", "release.day", "release.year"), sep = " ") # Separating the date column
DB <- separate(DB, Genre, c("Genre.1", "Genre.2", "Genre.3", "Genre.4", "Genre.5", "Genre.6"), sep = ", ")# Separating the genre column

# Cleaning from unwanted symbols that might affect the analysis.
DB[] <- lapply(DB, gsub, pattern=',', replacement='') # Deleting all the , symbols.
DB[] <- lapply(DB, gsub, pattern="'", replacement='') # Deleting all the ' symbols.
DB[] <- lapply(DB, gsub, pattern='//[', replacement='') # Deleting all the [ symbols.
DB[] <- lapply(DB, gsub, pattern='\\]', replacement='') # Deleting all the ] symbols.

cleaning_subtitles <- function(){
  #' Adding the subtitles files to the data frame
  #' 
  #' @return A data frame with the subtitles of all the movies.
  #' 

  progress_bar <- txtProgressBar(min = 0,
                                 max = number_of_subtitles_files,
                                 style = 3,
                                 width = 50,
                                 char = "=") # Creating a progress bar
  
  unwanted_words <- c('<b>', '<i>', 'font', 'listcontent', 'color808080', 'bfont',  'colorffff00')
  
  for (i in 1:number_of_subtitles_files){
    corpus <- VCorpus(VectorSource(DB$Subtitles[i]))
    corpus <- tm_map(corpus, removeWords, stopwords("english"))
    corpus <- tm_map(corpus, removeWords, unwanted_words)
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, stripWhitespace)
    DB$Subtitles[i] <- corpus[[1]]
    setTxtProgressBar(progress_bar, i)
  }
  close(progress_bar) # Closing progress bar
  .GlobalEnv$DB <- DB # Returning the dataframe to the global environment.
}

cleaning_subtitles()

# Descriptive Statistics ----------------------------

worldwide_sales_mean <- mean(as.numeric(DB$World.Sales..in...), na.rm = TRUE) # Worldwide Sales Mean calculation
worldwide_sales_mean # Displaying Worldwide Sales Mean

worldwide_sales_sd <- sd(as.numeric(DB$World.Sales..in...), na.rm = TRUE) # Worldwide Sales SD calculation
worldwide_sales_sd # Displaying Worldwide Sales SD

# Sentiment Analysis --------------------------------

## Obtain sentiment score

DB$Subtitles <- as.character(DB$Subtitles)
sentiment_score_DF <- get_nrc_sentiment(DB$Subtitles) # Creating a dataframe with sentiment scores.

full_DB <- cbind(DB, sentiment_score_DF) # Merging the dataframes

write.csv(full_DB, "C:/Users/yoavw/Documents/GitHub/Portfolio/Portfolio/R/new_dataset.csv")

## Creating Correlation matrix

sub_DB <- full_DB[, (c(9, 19:28))] # Only the relevant data for the correlation matrix

sub_DB$World.Sales..in... <- as.numeric(sub_DB$World.Sales..in...) # Turning the first column to numeric

colnames(sub_DB)[1] <- "Sales"

cor_for_table <- cor(sub_DB) # Calculating the correlation matrix

corrplot(corr = cor_for_table,
         method = "number",
         type = "lower")

corr.test(sub_DB)
