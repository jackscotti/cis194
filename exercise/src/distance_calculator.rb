require 'pry'
class DistanceCalculator
  OFFICE_COORDINATES = { "latitude" => 53.3393, "longitude" => -6.2576841 }
  EARTH_RADIUS_KM = 6371.0

  def calculate(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    earth_radius_in_km = 6371                  # Earth radius in kilometers

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    earth_radius_in_km * c # Delta in meters
  end
  #
  # def distance_2(point1, point2, options = {})
  #   # convert to coordinate arrays
  #   point1 = extract_coordinates(point1)
  #   point2 = extract_coordinates(point2)
  #
  #   # convert degrees to radians
  #   point1 = to_radians(point1)
  #   point2 = to_radians(point2)
  #
  #   # compute deltas
  #   dlat = point2[0] - point1[0]
  #   dlon = point2[1] - point1[1]
  #
  #   a = (Math.sin(dlat / 2))**2 + Math.cos(point1[0]) *
  #       (Math.sin(dlon / 2))**2 * Math.cos(point2[0])
  #   c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))
  #   c * earth_radius
  # end
end
