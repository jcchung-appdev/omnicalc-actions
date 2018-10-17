require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords
    @street_address = params.fetch("user_street_address")
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================

    url = "https://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_street_address+"&key=AIzaSyA5qwIlcKjijP_Ptmv46mk4cCjuWhSzS78"
    data = JSON.parse(open(url).read)
    
    @latitude = data.dig("results",0,"geometry", "location", "lat")

    @longitude = data.dig("results",0,"geometry", "location", "lng")

    render("geocoding_templates/street_to_coords.html.erb")
  end

  def street_to_coords_form
    render("geocoding_templates/street_to_coords_form.html.erb")
  end
end
