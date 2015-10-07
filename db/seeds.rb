  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  require "net/http"
  require "open-uri"
  require "json"



  def earth_grab

    uri = URI.parse("https://query.odatahq.com/v3/odatahq/bbetailgatehack/earthquakes/?$format=json")

    response = Net::HTTP.get_response(uri)

    data = JSON.parse(response.body)


    data['value'].each do |item|


      Earthquake.create!(time: item["time"],
                        latitude: item["latitude"],
                        longitude: item["longitude"],
                        depth: item["depth"],
                        mag: item["mag"],
                        magType: item["magType"],
                        gap: item["gap"],
                        dmin: item["dmin"],
                        rms: item["rms"],
                        place: item["place"]
                        )
    end

  end

  earth_grab
