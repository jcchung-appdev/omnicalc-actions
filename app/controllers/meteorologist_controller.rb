require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================
    
    geo_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_street_address+"&key="+ENV.fetch("GMAPS_KEY")
    geo_data = JSON.parse(open(geo_url).read)
    
    lat = geo_data.dig("results",0,"geometry", "location", "lat").to_s

    lng = geo_data.dig("results",0,"geometry", "location", "lng").to_s
    
    url = "https://api.darksky.net/forecast/"+ENV.fetch("DARKSKY_KEY")+"/"+lat+","+lng
    data = JSON.parse(open(url).read)
    
    @current_temperature = data.dig("currently","temperature")

    @current_summary = data.dig("currently","summary")

    @summary_of_next_sixty_minutes = data.dig("minutely", "summary")

    @summary_of_next_several_hours = data.dig("hourly", "summary")

    @summary_of_next_several_days = data.dig("daily", "summary")

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end
