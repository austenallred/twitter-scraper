require 'rubygems' 
require 'twitter'

client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "YOUR_CONSUMER_KEY"
        config.consumer_secret     = "YOUR_CONSUMER_SECRET"
        config.access_token        = "YOUR_ACCESS_TOKEN"
        config.access_token_secret = "YOUR_ACCESS_SECRET"
end

#----------------------------------
# enter the name of the file you want the scraped user IDs to go into
filename = "scraped_tweets.txt"

# enter usernames you want to scrape the tweets of, separated by commas
username_list = ['grasswire','cnnbrk','bbcbreaking','pzfeed','levinotik','jack','pmarca','breakingnews']

# select how many tweets you want to scrape?
tweetCount = 15
#----------------------------------

target = open(filename, 'a+')
ary = []

username_list.each do |user|
  puts "Now scraping tweets for #{user}"
  client.user_timeline("#{user}", options= {count: "#{tweetCount}", include_rts: false, exclude_replies: true}).take(10).collect do |tweet|
  ary.push(tweet.text)
  end
end

unique = ary.uniq
unique.each do |uniquetweet|
  target.write(uniquetweet)
  target.write("\n")
end

target.close

puts "All finished. The tweets have been saved in #{filename}"

