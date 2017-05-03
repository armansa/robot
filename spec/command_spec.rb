require './src/command'

describe Command do
  it "parse a command line and checks validity" do
    line = "PLACE 0,0,NORTH"
    command = Command.new.parse line
    expect(command.valid?).to be true
  end

  it "parse a command line but invalid" do
    line = "PLACE 0,0,LEFT"
    command = Command.new.parse line
    expect(command.valid?).to be false
  end
end
