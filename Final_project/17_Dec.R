if (!require("tm")) install.packages("tm")
library(tm)

preprocessing = function (doc){
  doc = gsub("[^[:alnum:]]"," ",doc)
  #create corpus
  corpus = Corpus(VectorSource(doc))
  #Removal of punctuation
  corpus = tm_map(corpus, removePunctuation)
  #Removal of numbers
  corpus = tm_map(corpus, removeNumbers)
  #Conversion to lower case
  corpus = tm_map(corpus, content_transformer(tolower)) 
  #customize my stopwords
  mystopword = "Here is what you need to know to start your day and will be back still said now"
  #Removal of stopwords
  corpus = tm_map(corpus, removeWords, c(stopwords("english"),mystopword))
  #retun result
  return(corpus)
}

news2000_clean = preprocessing(news2000$snippet)
news2008_clean = preprocessing(news2008_2$snippet)
news2016_clean = preprocessing(news2016$snippet)
news2021_clean = preprocessing(news2021$snippet)

if (!require("wordcloud")) install.packages("wordcloud")
library(wordcloud)

par(mfrow=c(1,4)) # 1x2 panel plot
par(mar=c(1, 3, 1, 3)) # Set the plot margin
par(bg="black") # set background color as black
par(col.main="white") # set title color as white
wordcloud(news2000_clean, scale=c(4,.5),min.freq=1, max.words=Inf, random.order=F, 
          colors = brewer.pal(8, "Set3"))   
title("Keywords 2000")
wordcloud(news2008_clean, scale=c(4,.5),min.freq=3, max.words=Inf, random.order=F, 
          colors = brewer.pal(8, "Set3"))   
title("Keywords 2008")
wordcloud(news2016_clean, scale=c(4,.5),min.freq=1, max.words=Inf, random.order=F, 
          colors = brewer.pal(8, "Set3"))   
title("Keywords 2016")
wordcloud(news2021_clean, scale=c(4,.5),min.freq=3, max.words=Inf, random.order=F, 
          colors = brewer.pal(8, "Set3"))   
title("Keywords 2021")

