# Emotion Analysis on Movies
## Authors
* [@LolipopnJoker](https://github.com/LolipopnJoker)
## Table of Contents
* [Business problem](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#business-problem)
* [Data source](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#data-source)
* [Methods](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#methods)
* [Tech Stack](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#tech-stack)
* [Quick glance at the results](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#quick-glance-at-the-results)
* [Lessons learned and recommendation](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#lessons-learned-and-recommendation)
* [Limitation and what can be improved](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#limitation-and-what-can-be-improved)
* [Repository structure](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/edit/main/README.md#repository-structure)
* [Run Locally](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#run-locally)
## Business problem
In this project, I analyzed the correlation between emotions manifested in movies scripts and the profits from those movies. I started this project because of my huge passion to movies. But since I was a little child, I had a tendency to prefer horror movies on any other genre of movies. While some of my friends were also fond of the genre, many people don't seem to like horror movies that much. This entire subject raised a question in my head – is there relationship between the emotions embodied in the movie script and its gross-profits?
## Data sources
* [Top 1000 Highest Grossing Movies](https://www.kaggle.com/datasets/sanjeetsinghnaik/top-1000-highest-grossing-movies) - This dataset contains information about the top 1000 highest grossing holywood films. I took it from Kaggle.
* [opensubtitles.org](https://www.opensubtitles.org/en/search/subs) - I used this website in order to download all the subtitles for the movies on the list.
## Methods
* Emotion Analysis of Text – the analysis is based on the NRC Sentiment and Emotion Lexicons. For further reading, fill free to read the [following article]( https://nrc.canada.ca/en/research-development/products-services/technical-advisory-services/sentiment-emotion-lexicons).
* Correlation Matrix – Pearson correlation coefficient was calculated for every possible combinations of (1) two of the six emotions from the NRC Lexicons; (2) the emotions and the two polarities (an emotion could be either negative or positive); and (3) each emotion/polarity and the gross profits.
While only the third type of correlation will answer my research question, I think the first two are essential for validating reasons.
## Tech stack
* R – the entire process was done within an R file named ['analysis.R'](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/analysis.R) – from the cleaning process, through the analysis phase to the plotting of the results.
## Quick glance at the results
* Correlation Matrix:
![](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/results/corr_matrix.jpeg)
  * Out of all the correlations between emotions and the movie's profits, only the correlation between fear and profits was significant. In other words, we can say that  the more scary a movie is, the more profit it will make. We do have to keep in mind that while this correlation is significant, it is still relatively small (0.12 is considered small).
## Lessons learned and recommendation
## Limitation and what can be improved
* Code - while my analysis code does run runs without errors, several improvements could be implemented:
  * Scraping the subtitles instead of manually downloading them – the entire project relies on the subtitle files. Because my web-scraping abilities aren’t good enough, I manually downloaded all the subtitles files. One of the improvements I want to in this project is to write a Python script that will automatically scrape the subtitles based on movie names.
  * Repetitiveness - There is repetitiveness in some parts of the code, mainly in the data cleaning section. This repetitiveness doesn't stop the code from running but makes it harder to scale up if needed or detect bugs if something slightly changes in the code.
  * Using a relational database instead of a CSV file – as mentioned in the [Data sources section]( https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#data-sources), I based this project on a publicly available dataset from Kaggle and all the subtitles for the movies. While the dataset from Kaggle is relatively small, it works fine with a CSV format. The subtitles, on the other hand, are hard to handle inside a CSV format due to their vast amounts of content.
One of the improvements I am planning to add in the future is to build two things:
    1.	A Python script that will retrieve the data from [IMDB's API]( https://developer.imdb.com/).
    2.	A database to store all the data (including variables such as the movie name, global profits, subtitles, etc.).

&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;&thinsp;&ensp;Those steps will make the project constantly up to date, as I intend to make the Python script run automatically once a week.
## Repository structure
## Run Locally
