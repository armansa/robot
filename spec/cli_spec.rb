require './src/cli'

describe Cli do
  it "parse input and prints output" do 
	  input = StringIO.new("PLACE 0,0,NORTH\nMOVE\nREPORT")
		output = StringIO.new
		cli = Cli.new input, output
		output.string.chomp.should eq "0,1,NORTH"
	end
end
