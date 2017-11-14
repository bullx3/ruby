# -*- encoding: utf-8 -*-

require 'twitter'

class OutputControl

	def initialize(isFile)
		@isFileOut = isFile
		if(@isFileOut)
			filename = File.basename(__FILE__) + ".log"
			@file = File.open(filename,"w");
		end

	end

	def output(str)
		if(@isFileOut)
			@file.puts str
		end

		puts str
	end
end 



config = {
	:consumer_key => 'xUBQpYYRaNWdTqEwmaPhGiS2Z',
	:consumer_secret => 'ioxqE7VeDoOkif4f8pBrPldzbF6lv1rAqrwA0oIamXrBlCt60K',
	:access_token => '921175982261678080-446THdNLrnBD3FMLO1hYKJfvs05zCBh',
	:access_token_secret => 'h3PTWBVmykHI9er2zoFRdLnTAG1Rk2nJzt2ZwLtgDA9JZ'
}


out = OutputControl.new(true)

client = Twitter::REST::Client.new(config)
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
