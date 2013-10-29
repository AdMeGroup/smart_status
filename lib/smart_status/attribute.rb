
module SMARTStatus
  class Attribute
    FIELDS_LIST=%w{
      id raw_name threshold_value threshold_value_worst threshold_level
      type updated raw when_failed
    }

    FIELDS_LIST.each do |field|
      attr_reader field.to_sym
    end

    alias :raw_value :raw

    # Matches if all fields match to passed value
    def ==(val)
      ! FIELDS_LIST.find do |field|
        self.send(field.to_sym) != val.send(field.to_sym)
      end
    end

    def initialize(values)
      FIELDS_LIST.each do |field|
        self.instance_variable_set(:"@#{field}", values[field.to_sym])
      end
    end

    def value
      case type
      when :pre_fail then threshold_value
      when :old_age then raw_value
      end
    end

    def formatted_name
      if !@formatted_name
        name = @raw_name.dup
        name.gsub!(/_/,' ')
        name.gsub!(/Ct$/,'Count')
        name.gsub!(/Cel$/,'Celsius')
        name.gsub!(/Uncorrect$/,'Uncorrectable')
        @formatted_name = name
      end
      @formatted_name
    end

    def unit
      if type == :pre_fail
        prefail_unit
      else
        unit = formatted_name.downcase.split(' ')[-1]  # extract last word
        unit.gsub!( /([^u])s$/, '\1') # convert plural to singular (except for words ending in 'us')
        if unit == 'uncorrectable'
          unit = 'sector'
        end
        unit
      end
    end

    def failure?
      type == :pre_fail && threshold_value <= threshold_level
    end

    def old_age?
      type == :old_age
    end

    def pre_fail?
      type == :pre_fail
    end

    alias :oldage? :old_age?
    alias :prefail? :pre_fail?

    attr_writer :prefail_unit

    def prefail_unit
      @prefail_unit ||= "%health"
    end
  end
end
