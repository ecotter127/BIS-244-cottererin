library(here)
library(tidyverse)
STATES <- read.csv(here("covid-19-data","us-states.csv"))

View(STATES)
PENNSYLVANIA <- filter(STATES, STATES$state=="Pennsylvania")
View(PENNSYLVANIA)

n <- length(PENNSYLVANIA$date)
PENNSYLVANIA$incr_cases <- 1
View(PENNSYLVANIA)

for (i in 2:n) {
  PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i]-PENNSYLVANIA$cases[i-1])
}

View(PENNSYLVANIA)

PENNSYLVANIA$incr_deaths <- 1
View(PENNSYLVANIA)

for (i in 2:n) {
  PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i]-PENNSYLVANIA$deaths[i-1])
}
View(PENNSYLVANIA)

SD <- sd(PENNSYLVANIA$incr_cases,na.rm=TRUE)
print(SD)

