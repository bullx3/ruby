# -*- encoding: utf-8 -*-

require 'twitter'

require './OutputControl.rb'
require './myconfig.rb'


out = OutputControl.new(true, __FILE__)

begin
	client = Twitter::REST::Client.new(TwitterConfig::Config)

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
	return -1
end

#正常な戻り
return 0

