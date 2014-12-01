require 'rubygems' 
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

#----------------------------------
#Enter the name of the file you want the scraped user IDs to go into
filename = "tweeps.txt" 

#Select your keywords to scrape
keyword1 = "follow back"
keyword2 = "#teamfollowback"
keyword3 = "#autofollow"

#Select how many user IDs each keyword should scrape
numberOfTweeps = 5000
#-----------------------------------

target = open(filename, 'w')
ary = []

puts "Grabbing #{keyword1} tweets"
client.search("#{keyword1} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
  ary.push(tweet.user.screen_name)
end

puts "Grabbing #{keyword2} tweets"
client.search("#{keyword2} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
  ary.push(tweet.user.screen_name)
end

puts "Grabbing #{keyword3} tweets"
client.search("#{keyword3} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
  ary.push(tweet.user.screen_name)
end

unique = ary.uniq
unique.each do |uniquetweet|
  target.write(uniquetweet)
  target.write("\n")
end

target.close

puts "All finished"