library("here")
library("tidyverse")

CHESS <- read_csv("Player_piece_info.zip")
View(CHESS)

p <- ggplot(CHESS, aes(x=player, color=color))

p + geom_bar()
