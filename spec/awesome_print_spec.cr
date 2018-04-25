require "./spec_helper"

describe AwesomePrint do
 
  it "lists contents of an array" do
    a = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115]
    r = ap a
    r.should eq "[100, 101, 102, 103, 104, 105, 106, \n107, 108, 109, 110, 111, 112, 113, \n114, 115]" 
  end

end
