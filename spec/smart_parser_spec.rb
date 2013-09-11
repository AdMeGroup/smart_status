require 'smart_parser'
require 'smart_attribute'
require 'fixtures'

describe SMARTParser do
  before do
    @output = File.read("spec/fixtures/output.txt")
    @stubbed_attributes = Fixtures.attributes_list
    @processed_attributes = {}
    @stubbed_attributes.each { |k,v| @processed_attributes[k]=SMARTAttribute.new(v) }
  end

  describe ".parse" do
    it "parses lines correctly" do
      attributes = SMARTParser.parse_lines(@output)
      attributes.should == @processed_attributes
    end
  end
end
