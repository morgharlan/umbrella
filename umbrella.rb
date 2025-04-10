# Write your soltuion here!
require "http"
require "json"
require "dotenv/load"

pp "Where are you located?"

user_location = gets.chomp

pp user_location

# /.env

gmaps_key = ENV.fetch("GMAPS_KEY")
pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")

pirate_weather_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

response = HTTP.get(pirate_weather_url)

raw_response = response.to_s

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

pp latitute = loc.fetch("lat")
pp longitute = loc.fetch("lng")

#currently_hash = parsed_response.fetch("currently")

#current_temp = currently_hash.fetch("temperature")

#puts "The current temperature is " + current_temp.to_s
