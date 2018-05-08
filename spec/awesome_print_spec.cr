require "./spec_helper"
require "ncurses"

describe AwesomePrint do
  it "Print a integer" do
    a = 100
    r = ap a
    r.should eq 100
  end

  it "Print a string" do
    a = "String"
    r = ap a
    r.should eq "\"String\""
  end

  it "lists contents of an array of Intergers" do
    a = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115]
    r = ap a
    r.should eq "[100, 101, 102, 103, 104, 105, 106, \n 107, 108, 109, 110, 111, 112, 113, \n 114, 115]"
  end

  it "lists contents of an array of Strings" do
    a = ["100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115"]
    r = ap a
    r.should eq "[\"100\", \"101\", \"102\", \"103\", \"104\", \"105\", \"106\", \n \"107\", \"108\", \"109\", \"110\", \"111\", \"112\", \"113\", \n \"114\", \"115\"]"
  end

  it "Print a float" do
    a = 100.5/3
    r = ap a
    r.should eq 33.5
  end

  it "Print a range" do
    a = 3..5
    r = ap a
    r.should eq 3..5
  end

  it "Print a char" do
    a = 'a'
    r = ap a
    r.should eq "'a'"
  end

  it "Print a hash" do
    a = {"one" => 1, "two" => 2}
    r = ap a
    r.should eq a
  end

  it "Print a hash" do
    a = [{"one" => 1, "two" => 2}, {"one" => 1, "two" => 2}]
    r = ap a
    r.should eq "[{\"one\" => 1, \"two\" => 2}, {\"one\" => 1, \"two\" => 2}]"
  end
end
