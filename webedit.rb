#!/usr/bin/env ruby

require 'sinatra'
require 'nokogiri'

filename = ARGV[0]

key = "helloworld"
ip = "127.0.0.1"

set :public_folder, 'public'
puts "go to http://#{ip}:4567/code/#{key}"

get '/code/' + key do
	@file = File.open(filename, "r")
	@data = @file.read
	@title = filename
	@ip = ip
	@file.close
	@key = key
	@mode = "ace/mode/text"
	erb :edit
end

get '/js/:file' do
	File.read("js/" + params["file"])
end

post '/edit/' + key do
	@file = File.open(filename, "w")
	new_data = params["new"]
	parsed = Nokogiri::HTML(new_data).css(".ace_line")

	for element in parsed do
		@file.write(element.text + "\n")
	end

	@file.close

	"Worked"
end
