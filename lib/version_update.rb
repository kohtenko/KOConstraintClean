require 'open-uri'
require 'json'
require 'colorize'

def notifyAboutUpdates
	json_object = JSON.parse(open("https://rubygems.org/api/v1/versions/constraintClean/latest.json").read)
    highest_version = Gem.loaded_specs['constraintClean'].version.to_s
    p json_object
    p highest_version
	if json_object["version"].nil?
		return 
	end
	if json_object["version"] > highest_version 
		puts "Updates are available!".green
		puts "Your current version of constraintClean is #{highest_version}".green
		puts "Run 'gem update constraintClean' to get latest version #{json_object['version']}".green
		puts ""
	end      
end
