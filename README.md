# Squid Game Sentiment Analysis using Python

The squid game is currently one of the most trending shows on Netflix. It is so much trending that people who have never watched any web series before are also watching it. One of the reasons behind this is the reviews and opinions of viewers on social media. So if you want to learn how to analyze the sentiments of people about Squid Game, then this article is for you. In this article, I will take you through the task of Squid Game sentiment analysis using Python.

## Squid Game Sentiment Analysis using Python

The dataset that I am using for the task of Squid Game sentiment analysis is downloaded from Kaggle, which was initially collected from Twitter while people were actively sharing their opinions about Squid Game.

--TASK -1

Let’s start the task of Squid Game sentiment analysis by importing the necessary Python libraries and the dataset:[tweets_6.csv](https://github.com/Vaishnavi12burde/Project-2-Python/files/8384088/tweets_6.csv)


--TASK -2

In first impressions of this dataset, I noticed null values in the “user_location” column that seem to not affect the sentiment analysis task. So I will drop this column:

Now let’s have a look at whether other columns contain any null values or not:


--TASK -3

The “user_description” column also contains null values, which will also not affect the sentiment analysis task. So I’m going to delete this column as well:


--TASK -4

The “text” column in the dataset contains the opinions of the users of Twitter about the squid game, as these are social media opinions, so this column needs to be prepared before any analysis. So let’s prepare this column for the task of sentiment analysis:


--TASK -5

Now let’s take a look at the most used words in the Squid Game opinions using a word cloud. A word cloud is a data visualization tool that displays the most used words in a larger size. Here is how you can visualize the word cloud of the text column:


--TASK -6

Now let’s move to the task of Squid Game sentiment analysis. Here I will add three more columns in this dataset as Positive, Negative, and Neutral by calculating the sentiment scores of the text column:


--TASK -7

Now let’s calculate how most people think about the Squid Game:


--TASK -8

So most of the opinions of the users are Neutral, now let’s have a look at the total of each sentiment score before making any conclusion:


### The total of negatives is much lower than that of Positive, so we can say that most of the opinions on the Squid Game are positive.
