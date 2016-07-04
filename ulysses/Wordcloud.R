# Acknowledgement:
# Code based on https://georeferenced.wordpress.com/2013/01/15/rwordcloud/
#

library(tm)
library(wordcloud)

words<-Corpus(DirSource("./ulysses/jjoyce", encoding="latin1"))

words<-tm_map(words,stripWhitespace)
words<-tm_map(words,tolower)

words<-tm_map(words,removeWords,stopwords("english"))
words<-tm_map(words, removePunctuation)
words<-tm_map(words, PlainTextDocument)

words<-tm_map(words,removeWords,"using")
words<-tm_map(words,removeWords,"use")
words<-tm_map(words,removeWords,"said")

png("ulysses.png", width=1000,height=1000)

wordcloud(words, 
          scale=c(3.5,0.8), 
          max.words=100,
          random.order=FALSE,
          rot.per=0.33, 
          use.r.layout=FALSE,
          colors=brewer.pal(8,"Dark2"))


dev.off()

