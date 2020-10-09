library(tidyverse)

trade_2008 <- read.csv("intrade08.csv")
trade_2012 <- read.csv("intrade12.csv")

polls_2008 <- read.csv("polls08.csv")
polls_2012 <- read.csv("polls12.csv")

election_2008 <- read.csv("pres08.csv")

year_2008 <- merge(trade_2008, election_2008, by = "state")

year_2012 <- merge(trade_2012, election_2012, by = "state")

last90_2008 <- subset(year_2008,
                      subset = (day >= as.Date("2008-08-06") & day <= as.Date("2008-11-04")))
last90_2008$Obamawin <- ifelse((last90_2008$Obama) > (last90_2008$McCain), 1, 0)

Obama_win <- subset(last90_2008, 
                    subset = (Obamawin == 1))


new_tib <- Obama_win %>%
  group_by(day)