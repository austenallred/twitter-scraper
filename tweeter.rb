require 'rubygems' 
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

#----------------------------------
# enter the name of the file where the scraped tweets are stored
filename = "scraped_tweets.txt"

# enter how long you want the delay to be between tweets
delay = 700
#----------------------------------

ary = []
if ary.count == 0
  f = open(filename, 'r')
  tweets = f.read
  ary = tweets.split("\n")
  puts "preparing to tweet -> " + ary.inspect
  if ary.count == 0
    puts "You need to add some tweets to #{filename} in order to tweet them"
  end
end

ary.each do |tweet|
  client.update(tweet)
  puts ">>> tweeted #{tweet}"
  ary.delete(tweet)
  puts "Deleted that tweet from the list of things to tweet"
  puts "waiting #{delay} seconds"
  sleep(delay)
  puts "finished waiting"
end

puts "I've tweeted all of the tweets"

deleting = open(filename, 'w+')
filename.truncate
puts "Removed all of the tweets from #{filename} since we've already tweeted them all."
puts "All finished"