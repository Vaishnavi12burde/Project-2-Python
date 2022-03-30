--TASK 1

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from wordcloud import WordCloud, STOPWORDS, ImageColorGenerator

data = pd.read_csv("squid_game.csv")
print(data.head())

-- user_name  user_location  ...               source is_retweet
--0   the _ûndër-ratèd niggáh👊🏾            NaN  ...  Twitter for Android      False
--1  Best uncle on planet earth            NaN  ...  Twitter for Android      False
--2                      marcie            NaN  ...      Twitter Web App      False
--3                    YoMo.Mdp  Any pronouns   ...      Twitter Web App      False
--4             Laura Reactions         France  ...      Twitter Web App      False

--[5 rows x 12 columns]


--TASK 2

data = data.drop(columns="user_location", axis=1)

--Now let’s have a look at whether other columns contain any null values or not:

print(data.isnull().sum())

--user_name              4
--user_description    5211
--user_created           0
--user_followers         0
--user_friends           0
--user_favourites        0
--user_verified          0
--date                   0
--text                   0
--source                 0
--is_retweet             0
--dtype: int64



--TASK -3

data = data.drop(columns="user_description", axis=1)
data = data.dropna()


--TASK -4

import nltk
import re
nltk.download('stopwords')
stemmer = nltk.SnowballStemmer("english")
from nltk.corpus import stopwords
import string
stopword=set(stopwords.words('english'))

def clean(text):
    text = str(text).lower()
    text = re.sub('\[.*?\]', '', text)
    text = re.sub('https?://\S+|www\.\S+', '', text)
    text = re.sub('<.*?>+', '', text)
    text = re.sub('[%s]' % re.escape(string.punctuation), '', text)
    text = re.sub('\n', '', text)
    text = re.sub('\w*\d\w*', '', text)
    text = [word for word in text.split(' ') if word not in stopword]
    text=" ".join(text)
    text = [stemmer.stem(word) for word in text.split(' ')]
    text=" ".join(text)
    return text
data["text"] = data["text"].apply(clean)


--TASK 5

text = " ".join(i for i in data.text)
stopwords = set(STOPWORDS)
wordcloud = WordCloud(stopwords=stopwords, background_color="white").generate(text)
plt.figure( figsize=(15,10))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.show()


--TASK 6

nltk.download('vader_lexicon')
sentiments = SentimentIntensityAnalyzer()
data["Positive"] = [sentiments.polarity_scores(i)["pos"] for i in data["text"]]
data["Negative"] = [sentiments.polarity_scores(i)["neg"] for i in data["text"]]
data["Neutral"] = [sentiments.polarity_scores(i)["neu"] for i in data["text"]]
data = data[["text", "Positive", "Negative", "Neutral"]]
print(data.head())

 --text  Positive  Negative  Neutral
--0  life hit time poverti strike yougong yoo  let ...     0.173     0.108    0.719
--1                    marbl episod squidgam  ruin 😭😭😭     0.000     0.487    0.513
--2                                      squidgam time     0.000     0.000    1.000
--3  blood  slideim join squidgam thing im alreadi ...     0.142     0.277    0.581
--4  two first game player kill mask guy  bloodi ni...     0.000     0.461    0.539


--TASK 7

x = sum(data["Positive"])
y = sum(data["Negative"])
z = sum(data["Neutral"])

def sentiment_score(a, b, c):
    if (a>b) and (a>c):
        print("Positive 😊 ")
    elif (b>a) and (b>c):
        print("Negative 😠 ")
    else:
        print("Neutral 🙂 ")
sentiment_score(x, y, z)


--TASK 8

print("Positive: ", x)
print("Negative: ", y)
print("Neutral: ", z)

--Positive:  10604.55899999976
--Negative:  5171.334000000031
--Neutral:  64233.11800000302
