require 'pry'
class DistanceCalculator
  EARTH_RADIUS_KM = 6371.0
  OFFICE_COORDINATES = {
    "latitude" => 53.3393,
    "longitude" => -6.2576841,
  }

  # Formula from http://www.movable-type.co.uk/scripts/latlong.html
  def calculate(point)
    point_lat = point["latitude"]
    point_lon = point["longitude"]

    point_lat_rad  = to_radiants(point_lat)
    office_lat_rad = to_radiants(OFFICE_COORDINATES["latitude"])

    delta_lat_rad = to_radiants(OFFICE_COORDINATES["latitude"]  - point_lat)
    delta_lon_rad = to_radiants(OFFICE_COORDINATES["longitude"] - point_lon)

    a = (Math.sin(delta_lat_rad / 2))**2 + Math.cos(point_lat_rad) *
        (Math.sin(delta_lon_rad / 2))**2 * Math.cos(office_lat_rad)

    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    EARTH_RADIUS_KM * c
  end

private

  def to_radiants(degrees)
    degrees * Math::PI/180
  end
end
