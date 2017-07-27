#install.packages('RColorBrewer')

library(ggplot2)
library(dplyr)
library(gridExtra)
library(tidyr)
library(GGally)
library(reshape2)
library(RColorBrewer)


# Load the DataD:\GDrive\Udacity\Data Analyst\p6-Design\project
setwd("D:/GDrive/Udacity//Data Analyst/p6-Design/project")
qr <- read.csv("746841462_32017_1944_airline_delay_causes.csv")

dim(qr)

colnames(qr)[2] = 'month'
#qr$month = factor(qr$month)


str(qr)
summary(qr)
qr = select(qr, -X)
qr$percent_flights_delayed = qr$arr_del15 / qr$arr_flights

ggplot(aes(x=month), data = qr) +
  geom_histogram(stat='count') +
  scale_x_discrete(limits = c(1:12) )

numflights = sum(qr$arr_flights, na.rm = TRUE)


ggplot(aes(month, arr_del15), data = qr) +
  coord_flip() +
  geom_point() +
  scale_x_discrete(limits = c(1:12) )
  
qr[is.na(qr)] = 0

mayev = subset(qr, month == 5 & carrier == 'EV') 

ad_by_carrier = qr %>% group_by(month, carrier, carrier_name) %>% 
  summarise(
            total_flights = sum(arr_flights),
            total_delays = sum(arr_del15),
            total_cancels =  sum(arr_cancelled),
            total_diversions =  sum(arr_diverted),
            total_carrier_delay_mins = sum(carrier_delay),
            total_weather_delay_mins = sum(weather_delay),
            total_nas_delay_mins = sum(nas_delay),
            total_security_delay_mins = sum(security_delay),
            total_lateaircraft_delay_mins = sum(late_aircraft_delay),
            total_airports = n())
        %>% 
  ungroup() %>%    #### Summarize ungroups 1 layer (age), need to ungroup (gender)
  arrange(month)

ad_by_carrier[is.na(ad_by_carrier)] = 0

write.csv(file='ad_gathered_month_carrier.csv', x=ad_by_carrier_top6)

ggplot(aes(x=carrier, y=delays), data = ad_by_carrier) +
  geom_point(stat='summary', fun.y= mean) +
  geom_boxplot()


summary(ad_by_carrier$total_flights)

sum(subset(ad_by_carrier, carrier == 'AA')$total_carrier_delay_mins)

sum(subset(ad_by_carrier, carrier == 'AA')$total_flights)

average = 39012;

ad_by_carrier_filtered = filter(ad_by_carrier, total_flights > average)

ad_by_carrier_top6 = filter(ad_by_carrier, carrier == 'AA'|carrier == 'UA'|carrier == 'OO'|carrier == 'EV'|carrier == 'DL'|carrier == 'WN')

ad_by_reason = select(qr, -year, -airport_name, -arr_del15:-arr_delay)


ad_reasons_minutes = gather(ad_by_reason, attrib, value, arr_flights:percent_flights_delayed)

ad_reasons_by_minutes = ad_reasons_minutes  %>% group_by(month, carrier, carrier_name)
#ad_reasons_minutes = select(ad_reasons_minutes, -arr_del15:-X.arr_delay)


# Total minutes 
ggplot(aes(x=carrier, y=value/numflights * 1000), data = subset(ad_reasons_minutes, attrib != 'arr_flights' )) +
  coord_flip() +
  #facet_wrap(~ month) +
  geom_col(aes(fill=attrib))


ggplot(aes(x=month, y=value), data = subset(ad_reasons_minutes, attrib == 'percent_flights_delayed')) +
  #geom_point(aes(color=carrier), stat='summary', fun.y=mean) +
  #stat_summary(aes(color=carrier)) +
  scale_x_discrete() +
  scale_y_continuous(limits = c(0,0.5)) +
  geom_line(aes(color=carrier), stat='summary', fun.y=mean)



   ggplot(aes(x=month, y=percent_flights_delayed), data = qr) +
  #scale_y_continuous(limits = c(0,1)) +
  geom_line()
  #geom_line(aes(color = carrier))
  #facet_wrap(~ month) +

ad_passed = gather(qr, key = effect, value=value, arr_flights, arr_cancelled, arr_diverted, arr_del15)



ad_passed = select(ad_passed, -carrier_ct:-percent_flights_delayed)



ggplot(aes(x=carrier, y=value), data = subset(ad_passed, carrier == 'AA' & month == '1' & airport == 'ABQ')) +
  coord_flip() +
  geom_col(aes(fill=effect))




# Total cancels, diverts, delays to code
ggplot(aes(x=reorder(carrier, value), y=value), data = subset(ad_passed, effect != 'arr_flights')) +
  #coord_flip() +
  geom_col(aes(fill=effect))

ggplot(aes(x=reorder(carrier, value), y=value), data = subset(ad_passed, effect != 'arr_flights')) +
  #coord_flip() +
  geom_col(aes(fill=effect))


#filtering by airport only
ggplot(aes(x=month, y=value), data = subset(ad_passed, airport == "JFK" & effect != 'arr_flights')) +
  geom_col(aes(fill=effect)) +
  scale_x_discrete(limits = c(1:12) )

sum(subset(qr, carrier == 'HA')$arr_del15, na.rm = TRUE)

# filtering by carrier only
ggplot(aes(x=month, y=value), data = subset(ad_passed, effect != 'arr_flights' & carrier == 'AA')) +
  geom_col(aes(fill=effect)) +
  scale_x_discrete(limits = c(1:12) )

#filtering by airport and carrier
ggplot(aes(x=month, y=value), data = subset(ad_passed, airport == "JFK" & effect != 'arr_flights' & carrier == 'AA')) +
  geom_col(aes(fill=effect)) +
  scale_x_discrete(limits = c(1:12) )


ggplot(aes(x=carrier, y=value), data = subset(ad_passed, effect != 'arr_flights')) +
  coord_flip() +
  facet_wrap(~ month) +
  geom_col(aes(fill=effect))

ad_passed = select(ad_passed, -carrier_name, -airport_name)

write.csv(file='ad_data_gathered.csv', x=ad_passed)



