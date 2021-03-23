require_relative "../app/navigator"

RSpec.describe Navigator do

  before(:all) do
    @navigator = Navigator.new
  end

  context "finding final destination" do

    it "should return the destination where it should reach" do
      expect(@navigator.destination(["1","2","N"],["LMLMLMLMM"],["5","5"]))
      .to eq("1 3 N")
    end

    it "should return message if initial coordinates is not numeric" do
      expect(@navigator.destination(["1","B","N"],["LMLMLMLMM"],["5","5"]))
      .to eq("Coordinates are not numeric")
    end

    it "should return message if initial coordinate direction is not from four direction" do
      expect(@navigator.destination(["1","2","A"],["LMLMLMLMM"],["5","5"]))
      .to eq("Direction is not valid")
    end

    it "should return message if path travel commands are not correct" do
      expect(@navigator.destination(["1","2","N"],["LMLMLMLCM"],["5","5"]))
      .to eq("Wrong path command")
    end

    # it "should return the destination  with outside grid message" do
    #   expect(@navigator.destination(["3","3","E"],["MMRMMRMRRMM"],["5","5"]))
    #   .to eq("6 1 E This is out of grid")
    # end



  end
end
