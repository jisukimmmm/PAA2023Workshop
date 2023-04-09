### When did @PopAssocAmerica create the account?

prof <- get_user_profile(c("2836918220"))
prof #2014-10-01



### Find how many tweets related to #paa2022 have been sent out from @PopAssocAmerica this year


cpop <- count_all_tweets(
  query = c("paa2022"),
  users = c("PopAssocAmerica"),
  start_tweets = "2022-01-01T00:00:00Z",
  end_tweets = "2022-03-30T00:00:00Z",
)

sum(cpop$tweet_count)  #47


### Find the top 5 languages used in the #migrant topic (with geo) this year 


counttt <- count_all_tweets(
  query = c("migrants has:geo"),
  start_tweets = "2022-01-01T00:00:00Z",
  end_tweets = "2022-03-30T01:00:00Z",
)
sum(counttt$tweet_count) #3956

ttt <- get_all_tweets(
  query = c("migrants has:geo"),
  start_tweets = "2022-01-01T00:00:00Z",
  end_tweets = "2022-03-30T01:00:00Z",
  n=4000
)

length(ttt$lang)    #3932

lang <- ttt %>%
  group_by(lang) %>%
  tally()

ggplot(lang, aes(x = reorder(lang, -n), y = n)) +
  geom_bar(stat = "identity") # + scale_y_continuous(trans = 'log2')