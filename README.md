You'll need a .env file with the oauth variables necessary for a Twitter read/write application.
Go set up an application on dev.twitter.com, give it write access, then generate oauth keys for yourself.
Put them in the .env file with the following keys:

TWITTER_CONSUMER_KEY
TWITTER_CONSUMER_SECRET
TWITTER_OAUTH_TOKEN
TWITTER_OAUTH_SECRET

The first time you run you'll need to:
`rbenv rehash`
`bundle install`

After that, to run the script, use it like so:
`bundle exec foreman run ruby app.rb bomb every word --tweet`

Where you can substitute the words after app.rb and before --tweet with whatever you want.
