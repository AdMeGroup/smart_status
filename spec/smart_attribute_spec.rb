require 'spec_helper'

require 'smart_status/attribute'
require 'fixtures'

describe SMARTStatus::Attribute do
  describe "#new" do
    before do
      @attributes = Fixtures.attributes_list
      @smart_attributes = Hash[ @attributes.map { |_, attr| [_, SMARTStatus::Attribute.new(attr)] } ]
    end

    it "creates correct object" do
      @smart_attributes.each do |name,attr|
        attr.id.should == @attributes[name][:id]
        attr.raw_name.should == @attributes[name][:raw_name]
        attr.threshold_value.should == @attributes[name][:threshold_value]
        attr.threshold_value_worst.should == @attributes[name][:threshold_value_worst]
        attr.threshold_level.should == @attributes[name][:threshold_level]
        attr.type.should == @attributes[name][:type]
        attr.updated.should == @attributes[name][:updated]
        attr.raw.should == @attributes[name][:raw]
        attr.when_failed.should == @attributes[name][:when_failed]
      end
    end

    it "generates formatted name" do
      @smart_attributes.each do |name,attr|
        attr.formatted_name.should == @attributes[name][:formatted_name]
      end
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

  ### Pre-fail attributes behave all the same so testing only single one should be ok
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

    describe "#old_age?" do
      subject { attribute.old_age? }
      it { should be_false }
    end
  end

  ### Old-age attributes have unit names relying heavily on metric name so we should test them all
  context "oldage attribute" do
    let(:attributes) { Hash[ Fixtures.oldage_attributes.map { |_, attr| [_, SMARTStatus::Attribute.new(attr)] } ] }

    describe "#value" do
      it "returns raw value" do
        attributes.each do |_, attr|
          attr.value.should == attr.raw_value
        end
      end
    end

    describe "#unit" do
      it "correct unit" do
        attributes.each do |name, attr|
          attr.unit.should == Fixtures.oldage_attributes[name][:unit]
        end
      end
    end

    describe "#failure?" do
      it "always returns false" do
        attributes.each do |_, attr|
          attr.failure?.should be_false
        end
      end
    end

    describe "#old_age?" do
      it "always returns false" do
        attributes.each do |_, attr|
          attr.old_age?.should be_true
        end
      end
    end
  end
end
