##Requirements

This requires the [Twitter gem](https://github.com/sferik/twitter) and a registered Twitter application. Follow instructions for the Twitter gem in an empty directory first. 

##Config

In order to use this repo, you must first [generate a twitter application](https://apps.twitter.com/). Make sure to set the permissions to "read and write" (or optionally "read, write, and send direct messages"). 

Enter your twitter app credentials in the <code>user_scraper.rb</code> as follows:

        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "YOUR_CONSUMER_KEY"
            config.consumer_secret     = "YOUR_CONSUMER_SECRET"
            config.access_token        = "YOUR_ACCESS_TOKEN"
            config.access_token_secret = "YOUR_ACCESS_SECRET"
        end

##Usage

There are three fields that are recommended for editing. 

* The first, <code>filename = "tweeps.txt"</code>, determines where the outputted usernames will be saved. 

* The second, <code>keyword 1</code>, <code>keyword 2</code> and <code>keyword 3</code> are the keywords you'll be scraping for. (Leaving one blank will skip it).

* The third, <code>numberOfTweeps = 5000</code> determines how many twitter usernames will be scraped per keyword.

To run the program, go back to your command line in the root directory of the repo, and ener <code>ruby user_scraper.rb</code>


