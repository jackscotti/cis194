require './src/distance_calculator'

describe DistanceCalculator do
  before do
    @calculator = DistanceCalculator.new
  end

  context "calculating distance" do
    it "calculates distance" do
      point_a = { "latitude" => 46.3625, "longitude" => 15.114444 }
      point_b = { "latitude" => 46.055556, "longitude" => 14.508333 }

      expect(@calculator.calculate(point_a, point_b)).to eq 57.794355108740355
    end
  end
end
