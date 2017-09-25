require 'pry'
class DistanceCalculator
  OFFICE_COORDINATES = { "latitude" => 53.3393, "longitude" => -6.2576841 }
  EARTH_RADIUS_KM = 6371.0
  RADIANTS_PER_DEGREE = Math::PI/180

  def calculate(loc1, loc2)
    lat_1 = loc1["latitude"]
    lon_1 = loc1["longitude"]
    lat_2 = loc2["latitude"]
    lon_2 = loc2["longitude"]

    delta_lat_rad = to_radiants(lat_2 - lat_1)
    delta_lon_rad = to_radiants(lon_2 - lon_1)

    lat1_rad, lon1_rad = to_radiants(lat_1), to_radiants(lon_1)
    lat2_rad, lon2_rad = to_radiants(lat_2), to_radiants(lon_2)

    a = Math.sin(delta_lat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(delta_lon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    EARTH_RADIUS_KM * c # Delta in meters
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
private

  def to_radiants(degrees)
    degrees * RADIANTS_PER_DEGREE
  end
end
