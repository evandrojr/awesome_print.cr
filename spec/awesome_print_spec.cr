require "./spec_helper"

SYMBOLS  = %i(black red green)
INTEGERS = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115]

describe AwesomePrint do
  Spec.before_each {
    Formater.coloring = false
  }

  it "Print a integer" do
    a = 100
    r = ap a
    r.should eq 100
  end

  it "Print a string" do
    a = "String"
    r = ap a
    r.should eq "\"String\""
    # Formater.coloring = true
    # r = ap a
    # r.should eq "\"String\""
  end

  it "lists contents of an array of Intergers" do
    r = ap INTEGERS
    r.should eq "[100, 101, 102, 103, 104, 105, 106, \n 107, 108, 109, 110, 111, 112, 113, \n 114, 115]"
  end

  it "lists contents of an array of Strings" do
    a = ["100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115"]
    r = ap a
    r.should eq "[\"100\", \"101\", \"102\", \"103\", \"104\", \"105\", \"106\", \n \"107\", \"108\", \"109\", \"110\", \"111\", \"112\", \"113\", \n \"114\", \"115\"]"
  end

  it "prints a float" do
    a = 100.5/3
    r = ap a
    r.should eq 33.5
  end

  it "prints a range" do
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

  it "loops colors keys" do 
    ap Formater.colors.keys
  end   

  it "prints colored" do
    Formater.coloring = true
    data_types = ["String color is green", "Char is yellow", 'a', 'Z', 1, 2, 3, 4, 1.437643, 133.5e10, SYMBOLS, INTEGERS]
    data_types = data_types + SYMBOLS + INTEGERS
    puts "\n\n"
    puts "Benchmark:"
    puts
    puts "awesome_print's ap vs .inspect"
    puts
    puts "Boring data_types.inspect:"
    puts
    puts data_types.inspect
    puts "(No colors nor column size limits)"
    puts
    puts "Check it out ap data_types:"
    puts
    ap data_types
    puts "(That is what I call an awesome print!)"
  end
end
