require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'O5dHBFE4LsdEkzUs6lC0SG5RQ'
  config.consumer_secret = 'KHIbAxvt2VDb0Bqe5ptjgDCSj4Y5DdQVoNv5WPMt0sgWeDcYQm'
  config.access_token = '1923169898-GY5PB4pYow5VeIwMRjdEWbg4g3ZljbZecZDwUYD'
  config.access_token_secret = 'bSNatpCN9W9Mont1yNRz0uhUSkZxlshIT13FK5oNGC2wa'
end

search_term = URI::encode('#todayilearned')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = twitter.search("#{search_term}")

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end
