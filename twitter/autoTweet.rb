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

begin
	client = Twitter::REST::Client.new(config)

	tweetMessage = 
		"UBER EATS配達員で自由な時間で働きませんか？\n
		こちらから登録するとバイクで２万、自転車で１万もらえます。\n
		https://partners.uber.com/i/lyjqpn\n"
	client.update(tweetMessage)
#	nil + 5
	
rescue => error
	now = Time.new
	out.output(now.strftime("%Y/%m/%d %H:%M:%S"))
	out.output(error)
end

