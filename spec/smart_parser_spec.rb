require 'smart_parser'
require 'smart_attribute'
require 'fixtures'

describe SMARTParser do
  before do
    @output = File.read("spec/fixtures/output.txt")
    @stubbed_attributes = Fixtures.attributes_list
  end

  describe "#parse" do
    it "parses lines correctly" do
      attributes = SMARTParser.parse_lines(@output)
      attributes.each { |k,v| v.should == SMARTAttribute.new(@stubbed_attributes[k]) }
    end
  end
end
