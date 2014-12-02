require 'rubygems' 
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

#----------------------------------
# enter the name of the file you are pulling the user IDs from
filename = "tweets.txt"

# enter how long you want the delay to be between each follow
delay = 3
#----------------------------------


if ary.length = 0
  f = open(filename, 'r')
  names = f.read
  ary = names.split("\n")
  puts ary.inspect
end

ary.each do |username|
  client.follow(username)
  puts "Just followed #{username}"
  ary.delete(username)
  puts "Removed #{username} from the list of users to follow"
  puts "waiting #{delay} seconds"
  sleep(delay)
  puts "finished sleeping"
  puts "here are the users left to follow" 
end