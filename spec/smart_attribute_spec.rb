require 'spec_helper'

require 'smart_status/attribute'
require 'fixtures'

describe SMARTStatus::Attribute do
  describe "#new" do
    before do
      @attribute = Fixtures.oldage_attribute
      @smart_attribute = SMARTStatus::Attribute.new(@attribute)
    end

    it "creates correct object" do
      @smart_attribute.id.should == @attribute[:id]
      @smart_attribute.raw_name.should == @attribute[:raw_name]
      @smart_attribute.threshold_value.should == @attribute[:threshold_value]
      @smart_attribute.threshold_value_worst.should == @attribute[:threshold_value_worst]
      @smart_attribute.threshold_level.should == @attribute[:threshold_level]
      @smart_attribute.type.should == @attribute[:type]
      @smart_attribute.updated.should == @attribute[:updated]
      @smart_attribute.raw.should == @attribute[:raw]
      @smart_attribute.when_failed.should == @attribute[:when_failed]
    end

    it "generates formatted name" do
      @smart_attribute.formatted_name.should == @attribute[:formatted_name]
    end
  end

  context "instantiated object" do
    let(:attribute) { SMARTStatus::Attribute.new(Fixtures.prefail_attribute) }
    let(:attribute2) { SMARTStatus::Attribute.new(Fixtures.prefail_attribute_failing) }

    it "matches the object with same values" do
      attribute.should == attribute.dup
    end

    it "does not match the object with other values" do
      attribute.should_not == attribute2
    end
  end

  context "prefail attribute" do
    let(:attribute) { SMARTStatus::Attribute.new(Fixtures.prefail_attribute) }

    describe "#value" do
      it "returns threshold value" do
        attribute.value.should == attribute.threshold_value
      end
    end

    describe "#unit" do
      it "returns prefail unit" do
        attribute.unit.should == "%health"
      end
    end

    describe "#failure?" do
      subject { attribute.failure? }
      context "for failing attribute" do
        let(:attribute) { SMARTStatus::Attribute.new(Fixtures.prefail_attribute_failing) }
        it { should be_true }
      end
      context "for not failing attribute" do
        let(:attribute) { SMARTStatus::Attribute.new(Fixtures.prefail_attribute_nonfailing) }
        it { should be_false }
      end
    end
  end

  context "oldage attribute" do
    let(:attribute) { SMARTStatus::Attribute.new(Fixtures.oldage_attribute) }

    describe "#value" do
      it "returns raw value" do
        attribute.value.should == attribute.raw_value
      end
    end

    describe "#unit" do
      it "returns last verb" do
        attribute.unit.should == Fixtures.oldage_attribute[:unit]
      end
    end

    describe "#failure?" do
      subject { attribute.failure? }
      it { should be_false }
    end
  end
end
