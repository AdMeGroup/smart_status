require 'spec_helper'

require 'smart_status/parser'
require 'smart_status/attribute'
require 'fixtures'

describe SMARTStatus::Parser do
  before do
    @output = File.read("spec/fixtures/output.txt")
    @stubbed_attributes = Fixtures.attributes_list
    @processed_attributes = {}
    @stubbed_attributes.each { |k,v| @processed_attributes[k]=SMARTStatus::Attribute.new(v) }
  end

  describe ".parse" do
    it "parses lines correctly" do
      attributes = SMARTStatus::Parser.parse_lines(@output)
      attributes.each do |attribute,value|
        value.should == @processed_attributes[attribute]
      end
      attributes.count.should == @processed_attributes.count
    end
  end

  describe "#new" do
    let(:new_object) { SMARTStatus::Parser.new("/dev/sda1") }
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

    context "HDD" do
      it "is a block device" do
        Kernel.stub(:system).with(/test -b/).and_return(true)
        expect { new_object }.not_to raise_error
      end
      it "is not a block device" do
        Kernel.stub(:system).with(/test -b/).and_return(false)
        expect { new_object }.to raise_error
      end
    end
  end

  describe "#process" do
    before do
      Kernel.stub(:system).and_return(true) # for SMARTStatus::Parser.new
      SMARTStatus::Parser.any_instance.stub(:raw_data).and_return(@output)
      @new_object = SMARTStatus::Parser.new("/dev/sda1")
    end

    # FIXME: I could not make stubbing of kernel backticks work
    it "processes data got from smartctl"

    it "returns processed S.M.A.R.T. data" do
      attributes = @new_object.process
      attributes.each do |attribute,value|
        value.should == @processed_attributes[attribute]
      end
      attributes.count.should == @processed_attributes.count
    end
  end
end
