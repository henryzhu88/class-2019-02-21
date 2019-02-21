library(tidyverse)

library(devtools)
install_github("rstudio/gt")

orig <- read_csv(file = "https://raw.githubusercontent.com/TheUpshot/2018-live-poll-results/master/data/elections-poll-az06-3.csv",
                 col_types =  cols(
                   .default = col_character(),
                   turnout_scale = col_double(),
                   turnout_score = col_double(),
                   w_LV = col_double(),
                   w_RV = col_double(),
                   final_weight = col_double(),
                   timestamp = col_datetime(format = "")))
orig%>% select(response,educ4,final_weight)%>%
  group_by(educ4, response)%>%
  summarize(total=n())%>%
  filter(!educ4== "[DO NOT READ] Don't know/Refused")%>%
  spread(key=response,value=total)



