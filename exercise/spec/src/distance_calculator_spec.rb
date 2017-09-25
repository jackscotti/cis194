require './src/distance_calculator'

describe DistanceCalculator do
  before do
    @calculator = DistanceCalculator.new
  end

  context "calculating distance" do
    it "calculates distance" do
      expect(@calculator.calculate(
        [46.3625, 15.114444],[46.055556, 14.508333]
      )).to eq 57.794355108740355
    end
  end
end
