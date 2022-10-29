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
* [Run Locally](https://github.com/LolipopnJoker/Movies_Emotion_Analysis/blob/main/README.md#run-locally)
## Business problem
In this project, I analyzed the correlation between emotions manifested in movies scripts and the profits from those movies. I started this project because of my huge passion to movies. But since I was a little child, I had a tendency to prefer horror movies on any other genre of movies. While some of my friends were also fond of the genre, many people don't seem to like horror movies that much. This entire subject raised a question in my head – is there relationship between the emotions embodied in the movie script and its gross-profits?
## Data source
* [Top 1000 Highest Grossing Movies](https://www.kaggle.com/datasets/sanjeetsinghnaik/top-1000-highest-grossing-movies) - This dataset contains information about the top 1000 highest grossing holywood films. I took it from Kaggle.
* [opensubtitles.org](https://www.opensubtitles.org/en/search/subs) - I used this website in order to download all the subtitles for the movies on the list.
## Methods
* Emotion Analysis of Text – the analysis is based on the NRC Sentiment and Emotion Lexicons. For further reading, fill free to read the [following article]( https://nrc.canada.ca/en/research-development/products-services/technical-advisory-services/sentiment-emotion-lexicons).
* Correlation Matrix – Pearson correlation coefficient was calculated for every possible combinations of (1) two of the six emotions from the NRC Lexicons; (2) the emotions and the two polarities (an emotion could be either negative or positive); and (3) each emotion/polarity and the gross profits.
While only the third type of correlation will answer my research question, I think the first two are essential for validating reasons.
## Tech Stack
## Quick glance at the results
## Lessons learned and recommendation
## Limitation and what can be improved
## Run Locally
