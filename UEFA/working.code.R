
dir.create("./UEFA")
setwd("./UEFA")
# establish and enter the working directory specific for analyzing UEFA data


library(XML)
# import the library for XML webpage scraping


url <- "http://kassiesa.home.xs4all.nl/bert/uefa/data/method1/match1965.html"
# enter the url for data retrieving



data <- xmlRoot(htmlTreeParse(url,useInternal=T, encoding="UTF-8"))
#encoding of UTF-8 can solve the accent problems


node.definer.tour <- "//div[@style='line-height: 56px; border: 2px solid #999999;']"
node.definer.round <- "//div[@style='line-height: 36px; border: 2px solid #999999;']"
node.definer.record <- "//td"

# define the node definer of different types of data
# first definer is tournament; second definer is round; third definer is record



tour.raw <- xpathSApply(data,node.definer.tour,xmlValue)
round.raw <- xpathSApply(data,node.definer.round,xmlValue)
# get the tournament name and round name (raw data)

tour <- substr(tour.raw,2,nchar(tour.raw)-1)
round <- substr(round.raw,2,nchar(round.raw)-1)
# get the basic elements of tournament and round





record <- xpathSApply(data,node.definer.record,xmlValue)
# get the record data from xml data

record <- record[6:(length(record)-3)]
# clean the record vector (delete the head and tail)

record <- record[nchar(gsub("\\s","",record))!=0]
# delete the space-only records

record <- record[!grepl("\n",record)]
# delete special lines including "\n"

record <- append(record,NA,after=374)
record <- append(record,NA,after=633)
record <- append(record,NA,after=352)
record <- append(record,NA,after=179)

# manually append an NA value for empty scores
# this can be dropped by future manipulations



home.team <- rep(record[seq(from=1,to=length(record),by=6)],each=2)
home.ctry <- rep(record[seq(from=2,to=length(record),by=6)],each=2)
away.team <- rep(record[seq(from=3,to=length(record),by=6)],each=2)
away.ctry <- rep(record[seq(from=4,to=length(record),by=6)],each=2)
# generate the names of teams and countries



match1 <- record[seq(from=5,to=length(record),by=6)]
match2 <- record[seq(from=6,to=length(record),by=6)]
# generate two-round match scores (with unequal length)



match <- c(as.vector(rbind(match1,match2)))

match.number <- length(match)
# merge the two-round match vectors into one (be careful about the repetitive behaviour)
# thus the code is lengthy


tour.seq.1 <- c(30,16,8,4,2)
tour.seq.2 <- c(28,16,8,4,2)
tour.seq.3 <- c(48,24,12,4,4,2)

sum1 <- sum(tour.seq.1)
sum2 <- sum(tour.seq.2)
sum3 <- sum(tour.seq.3)
### this block is used to generate list of tournament names and round names

tour <- mapply(rep,tour,c(sum1,sum2,sum3),simplify=TRUE)
# get the established list of tournament

round <- mapply(rep,round,c(tour.seq.1,tour.seq.2,tour.seq.3),simplify=TRUE)
# get list of round names (but in list form)


tourlist <- c()
for (i in 1:length(tour)) {
       tourlist <- c(tourlist,c(tour[[i]]))
       
}
# convert the list form tournament names into vector form



roundlist <- c()
for (i in 1:length(round)) {
       roundlist <- c(roundlist,c(round[[i]]))
       
}
# convert the list form round names into vector form





rm(round,tour,round.raw,tour.raw)
rm(match1,match2)
rm(tour.seq.1,tour.seq.2,tour.seq.3)
rm(sum1,sum2,sum3)
# remove unecessary variables



### combine all the data and trim the tail according to match.number

dfrm.raw <- cbind(home.team=home.team,home.ctry=home.ctry,away.team=away.team,
            away.ctry=away.ctry,match=match,tournament=tourlist,round=roundlist)

dfrm <- dfrm.raw[complete.cases(dfrm.raw[,5]),]

rm(dfrm.raw)

write.table(dfrm,"dfrm.1965.csv")




