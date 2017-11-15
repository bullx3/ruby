class OutputControl

	def initialize(isFile, filename)
		@isFileOut = isFile
		if(@isFileOut)
			filename = File.basename(filename) + ".log"
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
