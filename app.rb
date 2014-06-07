require 'twitter'
require 'optparse'

URL_PREFIX = "https://twitter.com/everyword/statuses/"

options = {}
OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"

    opts.on("-t", "--tweet", "Tweet instead of printing") do |t|
        options[:tweet] = true
    end
end.parse!


lines= File.open("archive.csv", "r")
words = {}
lines.each do |line|
  split = line.split(',')
  words[split.last.chomp.to_sym] = split.first
end

if options[:tweet] then
  client = Twitter::REST::Client.new do |config|
      config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_OAUTH_TOKEN']
      config.access_token_secret = ENV['TWITTER_OAUTH_SECRET']
  end
end

ARGV.reverse.each do |word|
  id = words[word.to_sym]

  if options[:tweet] then
    if id.nil?
      client.update("(#{word})")
    else
      client.retweet(words[word.to_sym])
    end
  else
    puts "#{word}: #{URL_PREFIX + words[word.to_sym]}"
  end
end

