require 'smart_parser'
require 'fixtures'

describe SMARTParser do
  before do
    @output = File.read("spec/fixtures/output.txt")
    @stubbed_attributes = Fixtures.attributes_list
  end


#  describe "#initialize" do
#    it "should fill in attributes with passed value" do
#      @new_one = SMARTParser.new(@stubbed_attributes)
#      @new_one.attributes.should == @stubbed_attributes
#    end
#  end

  describe "#parse" do
    it "should parse lines correctly" do
      attributes = SMARTParser.parse_lines(@output)
      attributes.each { |k,v| v.should == @stubbed_attributes[k] }
    end
  end
end
