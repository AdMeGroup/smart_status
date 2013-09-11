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

  describe "#new" do
    let(:new_object) { SMARTParser.new("/dev/sda1") }
    before do
      Kernel.stub(:system).and_return(true)
    end
    context "smartctl is run" do
      it "produces no error when success" do
        Kernel.stub(:system).with(/smartctl/).and_return(true)
        expect { new_object }.not_to raise_error
      end
      it "raises exception when error running" do
        Kernel.stub(:system).with(/smartctl/).and_return(false)
        expect { new_object }.to raise_error
      end
    end

    context "device" do
      it "is readable" do
        Kernel.stub(:system).with(/test -r/).and_return(true)
        expect { new_object }.not_to raise_error
      end
      it "is not readable" do
        Kernel.stub(:system).with(/test -r/).and_return(false)
        expect { new_object }.to raise_error
      end
    end
  end

  describe "#process" do
    before do
      Kernel.stub(:system).and_return(true) # for SMARTParser.new
      SMARTParser.any_instance.stub(:raw_data).and_return(@output)
      @new_object = SMARTParser.new("/dev/sda1")
    end

    # FIXME: I could not make stubbing of kernel backticks work
    it "processes data got from smartctl"

    it "returns processed S.M.A.R.T. data" do
      @new_object.process.should eq(@processed_attributes)
    end
  end
end
