api = "Ld9HkVSr57DjHtm6WwTzEet3peeS6Uzb"
if (!require("jsonlite")) install.packages("jsonlite")
library(jsonlite)

nyt_search = function (keyword, year){
  searchQ = URLencode(keyword)
  url = paste('http://api.nytimes.com/svc/search/v2/articlesearch.json?q=',searchQ,
              '&begin_date=',year,'0101&end_date=',year,'1231&&api-key=',api,sep="")
  ##convert json to R object
  initialQuery = fromJSON(url,flatten=TRUE)
  maxPages = round((initialQuery$response$meta$hits / 10)-1)
  maxPages = ifelse(maxPages >= 99, 99, maxPages)
  
  #download all the data and transform into R obj
  df = data.frame(created_time=character(),snippet=character(),headline=character(),wordcount=numeric(),section=character())
  for(i in 0:maxPages){
    nytSearch <- fromJSON(paste0(url, "&page=", i))
    temp = data.frame(created_time = nytSearch$response$docs$pub_date,
                      snippet = nytSearch$response$docs$snippet,
                      headline = nytSearch$response$docs$headline$main,
                      wordcount = nytSearch$response$docs$word_count,
                      section = nytSearch$response$docs$section_name,
                      stringsAsFactors = F)
    df = rbind(df,temp)
    Sys.sleep(6) #sleep for 6 seconds
  }
  return(df)
}

#2012
news2012 = nyt_search('Denmark',2012)
write.csv(news2012, "Denmark 2012.csv")
news2012 = read.csv("Denmark 2012.csv",header=T,stringsAsFactors = F)

#2013
news2013= nyt_search('Denmark',2013)
write.csv(news2013, "Denmark 2013.csv")
news2013 = read.csv("Denmark 2013.csv",header=T,stringsAsFactors = F)

#2014
news2014= nyt_search('Denmark',2014)
write.csv(news2014, "Denmark 2014.csv")
news2014 = read.csv("Denmark 2014.csv",header=T,stringsAsFactors = F)

#2015
news2015= nyt_search('Denmark',2015)
write.csv(news2015, "Denmark 2015.csv")
news2015 = read.csv("Denmark 2015.csv",header=T,stringsAsFactors = F)

#2016
news2016= nyt_search('Denmark',2016)
write.csv(news2016, "Denmark 2016.csv")
news2016 = read.csv("Denmark 2016.csv",header=T,stringsAsFactors = F)

#2017
news2017= nyt_search('Denmark',2017)
write.csv(news2017, "Denmark 2017.csv")
news2017 = read.csv("Denmark 2017.csv",header=T,stringsAsFactors = F)

#2018
news2018= nyt_search('Denmark',2018)
write.csv(news2018, "Denmark 2018.csv")
news2018 = read.csv("Denmark 2018.csv",header=T,stringsAsFactors = F)

#2019
news2019= nyt_search('Denmark',2019)
write.csv(news2019, "Denmark 2019.csv")
news2019 = read.csv("Denmark 2019.csv",header=T,stringsAsFactors = F)

#2020
news2020= nyt_search('Denmark',2020)
write.csv(news2020, "Denmark 2020.csv")
news2020 = read.csv("Denmark 2020.csv",header=T,stringsAsFactors = F)

#2021
news2021= nyt_search('Denmark',2021)
write.csv(news2021, "Denmark 2021.csv")
news2021 = read.csv("Denmark 2021.csv",header=T,stringsAsFactors = F)

#2022
news2022= nyt_search('Denmark',2022)
write.csv(news2022, "Denmark 2022.csv")
news2022 = read.csv("Denmark 2022.csv",header=T,stringsAsFactors = F)

#2000
news2000= nyt_search('Denmark',2000)
write.csv(news2000, "Denmark 2000.csv")
news2000 = read.csv("Denmark 2000.csv",header=T,stringsAsFactors = F)

#2001
news2001= nyt_search('Denmark',2001)
write.csv(news2001, "Denmark 2001.csv")
news2001 = read.csv("Denmark 2001.csv",header=T,stringsAsFactors = F)

#2002
news2002= nyt_search('Denmark',2002)
write.csv(news2002, "Denmark 2002.csv")
news2002 = read.csv("Denmark 2002.csv",header=T,stringsAsFactors = F)

#2003
news2003= nyt_search('Denmark',2003)
write.csv(news2003, "Denmark 2003.csv")
news2003 = read.csv("Denmark 2003.csv",header=T,stringsAsFactors = F)

#2004
news2004= nyt_search('Denmark',2004)
write.csv(news2004, "Denmark 2004.csv")
news2004 = read.csv("Denmark 2004.csv",header=T,stringsAsFactors = F)

#2005
news2005= nyt_search('Denmark',2005)
write.csv(news2005, "Denmark 2005.csv")
news2005 = read.csv("Denmark 2005.csv",header=T,stringsAsFactors = F)

#2006
news2006= nyt_search('Denmark',2006)
write.csv(news2006, "Denmark 2006.csv")
news2006 = read.csv("Denmark 2006.csv",header=T,stringsAsFactors = F)

#2007
news2007= nyt_search('Denmark',2007)
write.csv(news2007, "Denmark 2007.csv")
news2007 = read.csv("Denmark 2007.csv",header=T,stringsAsFactors = F)

#2008
news2008= nyt_search('Denmark',2008)
write.csv(news2008, "Denmark 2008.csv")
news2008 = read.csv("Denmark 2008.csv",header=T,stringsAsFactors = F)

#2009
news2009= nyt_search('Denmark',2009)
write.csv(news2009, "Denmark 2009.csv")
news2009 = read.csv("Denmark 2009.csv",header=T,stringsAsFactors = F)

# Increase the number of maxPages because there seems to be more than 1000 articles in 2005-2009
nyt_search_2 = function (keyword, year){
  searchQ = URLencode(keyword)
  url = paste('http://api.nytimes.com/svc/search/v2/articlesearch.json?q=',searchQ,
              '&begin_date=',year,'0101&end_date=',year,'1231&&api-key=',api,sep="")
  ##convert json to R object
  initialQuery = fromJSON(url,flatten=TRUE)
  maxPages = round((initialQuery$response$meta$hits / 10)-1)
  maxPages = ifelse(maxPages >= 150, 150, maxPages)
  
  #download all the data and transform into R obj
  df = data.frame(created_time=character(),snippet=character(),headline=character(),wordcount=numeric(),section=character())
  for(i in 0:maxPages){
    nytSearch <- fromJSON(paste0(url, "&page=", i))
    temp = data.frame(created_time = nytSearch$response$docs$pub_date,
                      snippet = nytSearch$response$docs$snippet,
                      headline = nytSearch$response$docs$headline$main,
                      wordcount = nytSearch$response$docs$word_count,
                      section = nytSearch$response$docs$section_name,
                      stringsAsFactors = F)
    df = rbind(df,temp)
    Sys.sleep(6) #sleep for 6 seconds
  }
  return(df)
}

#2006 with more pages
news2006_2= nyt_search_2('Denmark',2006)
write.csv(news2006_2, "Denmark 2006 with more pages.csv")
news2006_2 = read.csv("Denmark 2006 with more pages.csv",header=T,stringsAsFactors = F)

#2007 with more pages
news2007_2= nyt_search_2('Denmark',2007)
write.csv(news2007_2, "Denmark 2007 with more pages.csv")
news2007_2 = read.csv("Denmark 2007 with more pages.csv",header=T,stringsAsFactors = F)

#2008 with more pages
news2008_2= nyt_search_2('Denmark',2008)
write.csv(news2008_2, "Denmark 2008 with more pages.csv")
news2008_2 = read.csv("Denmark 2008 with more pages.csv",header=T,stringsAsFactors = F)

#2009 with more pages
news2009_2= nyt_search_2('Denmark',2009)
write.csv(news2009_2, "Denmark 2009 with more pages.csv")
news2009_2 = read.csv("Denmark 2009 with more pages.csv",header=T,stringsAsFactors = F)

#2010
news2010= nyt_search_2('Denmark',2010)
write.csv(news2010, "Denmark 2010.csv")
news2010 = read.csv("Denmark 2010.csv",header=T,stringsAsFactors = F)


# NUMBER OF ARTICLES
number_of_articles <- c(730, 640, 828, 710, 770, 889, 1510, 1137, 1345, 1310, 769, 790, 760, 656, 759, 886, 740, 579, 725, 650, 670, 677, 590)
years <- c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022)

# Create a basic stair steps plot 
plot(years, number_of_articles, type = "S")

# Show both points and line
plot(years, number_of_articles, type = "h", lwd=5, 
     col = "red", xlab = "year", ylab = "number of articles")

 plot(years, number_of_articles, type="l", col="red", lwd=2, xlab="time", ylab="concentration", main="Exponential decay")

# CREATING DATA FRAME
table_number_of_articles.df <- data_frame(years, number_of_articles)


table_number_of_articles.df %>%
  tail(10) %>%
  ggplot( aes(x=years, y=number_of_articles)) +
  geom_line() +
  geom_point()

# CALCULATING THE AVERAGE NUMBER
average_number <- mean(number_of_articles)

install.packages("dplyr")                           # Install & load dplyr
library("dplyr")

data_rbind <- as.data.frame(bind_rows(a, b))  # Bind as rows
data_rbind  

install.packages("qpcR")                            # Install qpcR package
library("qpcR")                                     # Load qpcR package

data_cbind <- qpcR:::cbind.na(a, b)           # Bind as columns
data_cbind                                          # Print combined data

c <- news2002$wordcount

maxlength = max(length(a), length(b),
                length(c))
a = c(a, rep(NA, maxlength - length(a)))
b = c(b, rep(NA, maxlength - length(b)))
c = c(c, rep(NA, maxlength - length(c)))

studentdata <- data.frame(a, b, c)


# DATA FRAME FOR WORDCOUNT
wc2000 <- news2000$wordcount
wc2001 <- news2001$wordcount
wc2002 <- news2002$wordcount
wc2003 <- news2003$wordcount
wc2004 <- news2004$wordcount
wc2005 <- news2005$wordcount
wc2006 <- news2006_2$wordcount
wc2007 <- news2007_2$wordcount
wc2008 <- news2008_2$wordcount
wc2009 <- news2009_2$wordcount
wc2010 <- news2010$wordcount
wc2011 <- news2011$wordcount
wc2012 <- news2012$wordcount
wc2013 <- news2013$wordcount
wc2014 <- news2014$wordcount
wc2015 <- news2015$wordcount
wc2016 <- news2016$wordcount
wc2017 <- news2017$wordcount
wc2018 <- news2018$wordcount
wc2019 <- news2019$wordcount
wc2020 <- news2020$wordcount
wc2021 <- news2021$wordcount
wc2022 <- news2022$wordcount

maxlength = max(length(wc2000), length(wc2001), length(wc2002),length(wc2003), length(wc2004), length(wc2005),length(wc2006),length(wc2007), length(wc2008), length(wc2009), length(wc2010),length(wc2011), length(wc2012), length(wc2013), length(wc2014),length(wc2015), length(wc2016), length(wc2017), length(wc2018),length(wc2019), length(wc2020), length(wc2021), length(wc2022))

wc2000 = c(wc2000, rep(NA, maxlength - length(wc2000)))
wc2001= c(wc2001, rep(NA, maxlength - length(wc2001)))
wc2002 = c(wc2002, rep(NA, maxlength - length(wc2002)))
wc2003 = c(wc2003, rep(NA, maxlength - length(wc2003)))
wc2004 = c(wc2004, rep(NA, maxlength - length(wc2004)))
wc2005 = c(wc2005, rep(NA, maxlength - length(wc2005)))
wc2006 = c(wc2006, rep(NA, maxlength - length(wc2006)))
wc2007 = c(wc2007, rep(NA, maxlength - length(wc2007)))
wc2008 = c(wc2008, rep(NA, maxlength - length(wc2008)))
wc2009 = c(wc2009, rep(NA, maxlength - length(wc2009)))
wc2010 = c(wc2010, rep(NA, maxlength - length(wc2010)))
wc2011 = c(wc2011, rep(NA, maxlength - length(wc2011)))
wc2012 = c(wc2012, rep(NA, maxlength - length(wc2012)))
wc2013 = c(wc2013, rep(NA, maxlength - length(wc2013)))
wc2014 = c(wc2014, rep(NA, maxlength - length(wc2014)))
wc2015 = c(wc2015, rep(NA, maxlength - length(wc2015)))
wc2016 = c(wc2016, rep(NA, maxlength - length(wc2016)))
wc2017 = c(wc2017, rep(NA, maxlength - length(wc2017)))
wc2018 = c(wc2018, rep(NA, maxlength - length(wc2018)))
wc2019 = c(wc2019, rep(NA, maxlength - length(wc2019)))
wc2020 = c(wc2020, rep(NA, maxlength - length(wc2020)))
wc2021 = c(wc2021, rep(NA, maxlength - length(wc2021)))
wc2022 = c(wc2022, rep(NA, maxlength - length(wc2022)))

wordcountdataframe <- data.frame(wc2000, wc2001, wc2002, wc2003, wc2004, wc2005, wc2006, wc2007, wc2008, wc2009, wc2010, wc2011, wc2012, wc2013, wc2014, wc2015, wc2016, wc2017, wc2018, wc2019, wc2020, wc2021, wc2022)
write.csv(wordcountdataframe, "Wordcount.csv")
wordcountdataframe = read.csv("Wordcount.csv",header=T,stringsAsFactors = F)


mean(wordcountdataframe, na.rm = TRUE)

mean_of_all_years <- colMeans(wordcountdataframe, na.rm = TRUE)

mean_of_all_years

plot(years, mean_of_all_years, type = "h", lwd=5, 
     col = "red", xlab = "year", ylab = "average word count")

average_wc.df <- data.frame(years, mean_of_all_years)

average_wc.df %>%
  tail(10) %>%
  ggplot( aes(x=years, y=mean_of_all_years)) +
  geom_line() +
  geom_point()

plot(years, mean_of_all_years, type="l", col="red", lwd=2, xlab="time", ylab="concentration", main="Exponential decay")

install.packages("lpyr")
view("news2000")

table(news2000)

library("lpyr")
count(news2000$section)

library('vctrs')
a <- vec_count(news2000$section)
b <- vec_count(news2001$section)
c <- vec_count(news2002$section)
d <- vec_count(news2003$section)
e <- vec_count(news2004$section)
f <- vec_count(news2005$section)
g <- vec_count(news2006_2$section)
h <- vec_count(news2007_2$section)
i <- vec_count(news2008_2$section)
j <- vec_count(news2009_2$section)
k <- vec_count(news2010$section)
l <- vec_count(news2011$section)
m <- vec_count(news2012$section)
o <- vec_count(news2013$section)
p <- vec_count(news2014$section)
q <- vec_count(news2015$section)
r <- vec_count(news2016$section)
s <- vec_count(news2017$section)
t <- vec_count(news2018$section)
u <- vec_count(news2019$section)
v <- vec_count(news2020$section)
w <- vec_count(news2021$section)
x <- vec_count(news2022$section)

topsection <- c("Arts", "Arts", "World","World", "Business Day", "World", "World", "World", "Sports", "Blogs", "Business Day", "Arts", "Sports", "Arts", "Arts", "Arts", "Arts", "World", "World", "World", "World", "World", "World")

sectiondataframe <- data.frame(years, topsection)
write.csv(sectiondataframe, "Top_section.csv")
sectiondt = read.csv("Top_section.csv",header=T,stringsAsFactors = F)


