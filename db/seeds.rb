# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  require "json"

  def hparty(end_point)

    HTTParty.get(end_point,
      :timeout => 180,
      :verify => false)

  end

  # Turns JSON response into array of hashes all the way through
  def parse_me(json_obj)

    # begin
     puts json_obj.inspect
     JSON.parse(json_obj.body)
    # rescue JSON::ParserError, TypeError => e
    #  []
    # end

  end

  def parsed(end_point)
    response = hparty(end_point)
    parsed = parse_me(response)
  end

  def earth_grab

    binding.pry

    # Grabs JSON from API, using only endpoint, parses in to array of hashes
    earth_hash = parsed("https://query.odatahq.com/v3/odatahq/bbetailgatehack/earthquakes/?$format=json")

    puts earth_hash
    # Assigns each house member to a spot in the database
    earth_hash['value'].each do |item|

      # Creates Earthquakes from API stream

      Earthquake.create!(time: item["time"],
                        latitude: item["latitude"],
                        longitude: item["longitude"]
                        )
    end

  end

  earth_grab
