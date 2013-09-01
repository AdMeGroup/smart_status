require 'smart_attribute'
require 'fixtures'

describe SMARTAttribute do
  describe "#new" do
    before do
      @attribute = Fixtures.oldage_attribute
      @smart_attribute = SMARTAttribute.new(@attribute)
    end

    it "should create correct object" do
      @smart_attribute.id.should == @attribute[:id]
      @smart_attribute.threshold_value.should == @attribute[:threshold_value]
      @smart_attribute.threshold_value_worst.should == @attribute[:threshold_value_worst]
      @smart_attribute.threshold_level.should == @attribute[:threshold_level]
      @smart_attribute.type.should == @attribute[:type]
      @smart_attribute.updated.should == @attribute[:updated]
      @smart_attribute.raw.should == @attribute[:raw]
      @smart_attribute.when_failed.should == @attribute[:when_failed]
    end
  end

  context "prefail attribute" do
    let(:attribute) { SMARTAttribute.new(Fixtures.prefail_attribute) }

    describe "#value" do
      it "should return threshold value" do
        attribute.value.should == attribute.threshold_value
      end
    end

    describe "#failure?" do
      subject { attribute.failure? }
      context "failure" do
        let(:attribute) { SMARTAttribute.new(Fixtures.prefail_attribute_failing) }
        it { should be_true }
      end
      context "no failure" do
        let(:attribute) { SMARTAttribute.new(Fixtures.prefail_attribute_nonfailing) }
        it { should be_false }
      end
    end
  end

  context "oldage attribute" do
    let(:attribute) { SMARTAttribute.new(Fixtures.oldage_attribute) }

    describe "#value" do
      it "should return raw value" do
        attribute.value.should == attribute.raw_value
      end
    end

    describe "#failure?" do
      subject { attribute.failure? }
      it { should be_false }
    end
  end
end
