# -*- encoding: utf-8 -*-

require 'twitter'

require './OutputControl.rb'
require './myconfig.rb'


out = OutputControl.new(true, __FILE__)

client = Twitter::REST::Client.new(TwitterConfig::Config)
client.user_timeline('TomUberEATS').each{|tweet|
#client.home_timeline.each{|tweet|

	out.output(tweet.created_at)
	out.output(tweet.text)
	out.output(tweet.user.name)
	out.output("Retweetされた数：" + tweet.retweet_count.to_s)
	out.output("お気に入りされた数：" + tweet.favorite_count.to_s)
	out.output("位置情報：" + tweet.geo) if !tweet.geo.nil?

	out.output(tweet.uri)


	out.output("")
}
