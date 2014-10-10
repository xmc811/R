
dir.create("./UEFA")
setwd("./UEFA")
# establish and enter the working directory specific for analyzing UEFA data


library(XML)
# import the library for XML webpage scraping


url.1956 <- "http://kassiesa.home.xs4all.nl/bert/uefa/data/method1/match1956.html"
# enter the url for data retrieving



data.1956 <- xmlRoot(htmlTreeParse(url.1956,useInternal=T, encoding="UTF-8"))
#encoding of UTF-8 can solve the accent problems


node.definer.tour <- "//div[@style='line-height: 56px; border: 2px solid #999999;']"
node.definer.round <- "//div[@style='line-height: 36px; border: 2px solid #999999;']"
node.definer.record <- "//td"

# define the node definer of different types of data
# first definer is tournament; second definer is round; third definer is record



tour.1956.raw <- xpathSApply(data.1956,node.definer.tour,xmlValue)
round.1956.raw <- xpathSApply(data.1956,node.definer.round,xmlValue)
# get the tournament name and round name (raw data)

tour.1956 <- substr(tour.1956.raw,2,nchar(tour.1956.raw)-1)
round.1956 <- substr(round.1956.raw,2,nchar(round.1956.raw)-1)
# get the basic elements of tournament and round






record.1956 <- xpathSApply(data.1956,node.definer.record,xmlValue)
record.1956 <- record.1956[6:(length(record.1956)-3)]
record.1956 <- record.1956[nchar(gsub("\\s","",record.1956))!=0]
# clean the record vector (delete the head and tail)
# delete the space-only records



home.team.1956 <- rep(record.1956[seq(from=1,to=length(record.1956),by=6)],each=2)
home.ctry.1956 <- rep(record.1956[seq(from=2,to=length(record.1956),by=6)],each=2)
away.team.1956 <- rep(record.1956[seq(from=3,to=length(record.1956),by=6)],each=2)
away.ctry.1956 <- rep(record.1956[seq(from=4,to=length(record.1956),by=6)],each=2)
# generate the names of teams and countries



match1.1956 <- record.1956[seq(from=5,to=length(record.1956),by=6)]
match2.1956 <- record.1956[seq(from=6,to=length(record.1956),by=6)]
# generate two-round match scores (with unequal length)




if (length(match1.1956)>=length(match2.1956)) {
       match.1956 <- c(as.vector(rbind(match1.1956[1:length(match2.1956)],match2.1956)),
                       match1.1956[(length(match2.1956)+1):length(match1.1956)])
}else {
       match.1956 <- c(as.vector(rbind(match2.1956[1:length(match1.1956)],match1.1956)),
                       match2.1956[(length(match1.1956)+1):length(match2.1956)])
}

match.number <- length(match.1956)
# merge the two-round match vectors into one (be careful about the repetitive behaviour)
# thus the code is lengthy




### this block is used to generate list of tournament names and round names

tour.1956 <- rep(tour.1956,match.number)
# get the established list of tournament
round.1956 <- mapply(rep,round.1956,c(16,8,4,1),simplify=TRUE)
# get list of round names (but in list form)

roundlist.1956 <- c()
for (i in 1:length(round.1956)) {
       roundlist.1956 <- c(roundlist.1956,c(round.1956[[i]]))
       
}
# convert the list form round names into vector form





rm(round.1956,round.1956.raw,tour.1956.raw)
rm(match1.1956,match2.1956)
# remove unecessary variables



### combine all the data and trim the tail according to match.number

dfrm.1956 <- (cbind(home.team=home.team.1956,home.ctry=home.ctry.1956,away.team=away.team.1956,
                    away.ctry=away.ctry.1956,match=match.1956,tournament=tour.1956,
                    round=roundlist.1956))[1:match.number,]


write.table(dfrm.1956,"dfrm.1956.csv")

