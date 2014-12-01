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
keywordList = ["i follow back","#teamfollowback","autofollow"]

#Select how many user IDs each keyword should scrape
numberOfTweeps = 250
#-----------------------------------

target = open(filename, 'a+')
ary = []

keywordList.each do |keyword|
  puts "Grabbing #{numberOfTweeps} #{keyword} tweets"
  client.search("#{keyword} -rt", result_type: "recent").take(numberOfTweeps).collect do |tweet|
    ary.push(tweet.user.screen_name)
  end
end

unique = ary.uniq
unique.each do |uniquetweet|
  target.write(uniquetweet)
  target.write("\n")
end

target.close

puts "All finished. The usernames have been saved in #{filename}"