#!/usr/bin/env ruby
#
file = File.open("langs.txt" , "r").read

langs = file.split("\n")

for lang in langs do
	puts "<option>" + lang + "</option>"
end
