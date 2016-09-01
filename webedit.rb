#!/usr/bin/env ruby

require 'sinatra'
require 'nokogiri'

filename = ARGV[0]

puts "Detecting language..."
require 'linguist'
lang = Linguist::FileBlob.new(filename).language.to_s.downcase
puts "Document Language detected as #{@language}"


key = "helloworld"
ip = "0.0.0.0"

set :public_folder, 'public'
puts "go to http://#{ip}:4567/code/#{key}"
project_dir = File.dirname(__FILE__)

get '/code/' + key do
	@file = File.open(filename, "r")
	@data = @file.read
	@title = filename
	@ip = ip
	@file.close
	@key = key
	@mode = "ace/mode/#{lang}"
	erb :edit
end

get '/js/:file' do
	content_type "text/javascript"
	File.read(project_dir + "/js/" + params["file"])
end

post '/edit/' + key do
	@file = File.open(filename, "w")
	new_data = params["new"]
	parsed = Nokogiri::HTML(new_data).css(".ace_line")

	for element in parsed do

		if parsed.index(element) != (parsed.length - 1)
			@file.write(element.text + "\n")
		else
			@file.write(element.text)
		end
	end

	@file.close

	"Worked"
end
