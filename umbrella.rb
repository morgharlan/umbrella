# Write your soltuion here!
require "http"
require "json"
require "dotenv/load"

# /.env

gmaps_key = ENV.fetch("GMAPS_KEY")
pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")

pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_key + "/41.8887,-87.6355"

raw_response = HTTP.get(pirate_weather_url)


parsed_response = JSON.parse(raw_response)

currently_hash = parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "The current temperature is " + current_temp.to_s
