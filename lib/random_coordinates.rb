require "random_coordinates/version"
require 'border_patrol'

module RandomCoordinates
  class Error < StandardError; end

  EARTH_RADIUS = 6371 # km

  ##
  # @param centroid The coordinates to start from (:lat, :lng)
  # @param The maximum kilometers to go from central coordinates
  # @param kml The kml file to stay in, can be nil
  # @return [random_lat, random_lng]
  def self.at(centroid, radius, kml=nil)
    max_distance = Math.sqrt(radius * 100 / 3)
    min_distance = Math.sqrt(radius * 100 / 8)

    # Latitude north/south
    distance = Random.rand(min_distance..max_distance)
    new_lat = distance * 180 / (Math::PI * EARTH_RADIUS)
    new_lat = Random.rand(0..1).zero? ? new_lat : -new_lat # north (+) or south (-)

    # Longitude east/west
    distance = Random.rand(min_distance..max_distance)
    new_lng = distance * 180 / (Math::PI * EARTH_RADIUS * Math.cos(new_lat * Math::PI / 180))
    new_lng = Random.rand(0..1).zero? ? new_lng : -new_lng # east (+) or west (-)

    random_lat = (centroid[:lat] + new_lat).round(5) # meter precision
    random_lng = (centroid[:lng] + new_lng).round(5) # meter precision

    unless kml.nil?
      boundary = BorderPatrol.parse_kml(File.read(kml))
      if !boundary.contains_point?(random_lng, random_lat)
        at(centroid, kml, radius)
      end
    end

    [random_lat, random_lng]
  end
end
