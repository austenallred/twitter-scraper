require 'rubygems' 
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YLYujcYLVQZPKJPkZtC3pMqNd"
  config.consumer_secret     = "Ys66m7Kr5Jhbj9moqxUUmSEXnYahqWXwdZ0RdRnc8m0Hh6RlO9"
  config.access_token        = "1908943950-VhAIQYA4L7I7TAM6Ezx9cV1TavVuyx83421rsJt"
  config.access_token_secret = "m7QcaxLQnmtfPjbIW7neKGVYBjXDi8xtSZ8PfgL1By9xI"
end

#----------------------------------
# enter the name of the file you are pulling the user IDs from
filename = "tweeps.txt"

# enter how long you want the delay to be between each follow in seconds
delay = 7
#----------------------------------

ary = []
if ary.count == 0
  f = open(filename, 'r')
  names = f.read
  ary = names.split("\n")
  puts "preparing to follow -> " + ary.inspect
  if ary.count == 0
    puts "You need to add some usernames to #{filename} in order to follow them"
  end
end

ary.each do |username|
  client.follow(username)
  puts ">>> followed #{username}"
  ary.delete(username)
  puts "Removed #{username} from the list of users to follow"
  puts "waiting #{delay} seconds"
  sleep(delay)
  puts "finished sleeping"
  puts "here are the users left to follow" 
end

deleting = open(filename, 'w+')
filename.truncate
puts "Removed all of the accounts from tweeps.txt since we followed them all."
puts "All finished - all of the usernames have been followed."