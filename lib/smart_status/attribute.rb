
module SMARTStatus
  class Attribute
    attr_reader :id, :threshold_value, :threshold_value_worst, :threshold_level
    attr_reader :type, :updated, :raw, :when_failed

    alias :raw_value :raw

    FIELDS_LIST=%w{
      id threshold_value threshold_value_worst threshold_level type updated
      raw when_failed
    }

    # Matches if all fields match to passed value
    def ==(val)
      ! FIELDS_LIST.find do |field|
        self.send(field.to_sym) != val.send(field.to_sym)
      end
    end

    def initialize(values)
      @id = values[:id]
      @threshold_value = values[:threshold_value]
      @threshold_value_worst = values[:threshold_value_worst]
      @threshold_level = values[:threshold_level]
      @type = values[:type]
      @updated = values[:updated]
      @raw = values[:raw]
      @when_failed = values[:when_failed]
    end

    def value
      case type
      when :pre_fail then threshold_value
      when :old_age then raw_value
      end
    end

    def failure?
      type == :pre_fail && threshold_value <= threshold_level
    end

  end
end
