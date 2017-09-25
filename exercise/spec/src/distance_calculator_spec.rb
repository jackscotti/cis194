require './src/distance_calculator'

describe DistanceCalculator do
  before do
    @calculator = DistanceCalculator.new
  end

  context "calculating distance" do
    it "calculates distance" do
      customer_position = { "latitude" => 46.3625, "longitude" => 15.114444 }

      expect(@calculator.calculate(customer_position)).to eq 1708.4265635304328
    end
  end
end
