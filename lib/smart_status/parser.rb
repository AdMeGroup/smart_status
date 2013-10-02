require 'smart_status/attribute'

module SMARTStatus
  class Parser
    def self.parse_lines(input)
      lines = input.split("\n")

      lines = lines.map { |s| s.strip.gsub(/[[:blank:]]+/, ' ') } # strip extra spaces
      lines.select! { |s| s.match /^[[:digit:]]+ / } # strip header lines

      attributes = {}
      lines.each do |line|
        id, name, flag, value, worst, threshold, type, updated, when_failed, raw = line.split
        values = {
          :id => id.to_i,
          :raw_name => name,
          :threshold_value => value.to_i,
          :threshold_value_worst => worst.to_i,
          :threshold_level => threshold.to_i,
          :type => type.downcase.gsub(/-/, "_").to_sym,
          :updated => updated.downcase.to_sym,
          :when_failed => when_failed,
          :raw => raw.to_i
        }
        attributes[name.downcase.gsub(/-/, "_").to_sym] = SMARTStatus::Attribute.new(values)
      end

      attributes
    end

    attr_reader :options

    def initialize(device, options={})
      @options = {
        :smartctl => "/usr/sbin/smartctl"
      }.merge(options)

      Kernel.system("#{sudo} #{smartctl} -h > /dev/null") || raise("Cannot run 'sudo smartctl'")
      Kernel.system("#{sudo} test -r #{device}") || raise("Device #{device} is not readable")
      @device = device
    end

    def process
      self.class.parse_lines(raw_data)
    end

    private

    def raw_data
      result = `#{sudo} #{smartctl} -A #{@device}`
      if $? !=0
        raise "Error while getting SMART data for #{@device}"
      end
      result
    end

    # stub to use smartctl without sudo in some future
    def sudo
      "sudo"
    end

    # location of smartctl in the file tree
    def smartctl
      options[:smartctl]
    end
  end
end
