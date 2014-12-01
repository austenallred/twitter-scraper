require 'rubygems' 
require 'twitter'


config.consumer_key          = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

#----------------------------------
#Enter the name of the file you want the scraped user IDs to go into
filename = "tweeps.txt" 


#Select your keywords to scrape
keyword1 = "#ifollowback"
keyword2 = "follow back"
keyword3 = "#autofollow"

#Select how many user IDs each keyword should scrape
numberOfTweeps = 5000

#-----------------------------------

puts "Opening the file"
target = open(filename, 'w')

puts "Grabbing the #{keyword1} tweets"
client.search("#{keyword1} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
  target.write(tweet.user.screen_name)
  target.write("\n")
end

puts "Grabbing the #{keyword2} tweets"
client.search("#{keyword2} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
  target.write(tweet.user.screen_name)
  target.write("\n")
end

puts "Grabbing the #{keyword3} tweets"
client.search("#{keyword3} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
  target.write(tweet.user.screen_name)
  target.write("\n")
end

puts "Now closing the file."
target.close

puts "All finished"