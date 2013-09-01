class SMARTParser
  def self.parse_lines(input)
    lines = input.split("\n")

    lines = lines.map { |s| s.strip.gsub(/[[:blank:]]+/, ' ') } # strip extra spaces
    lines.select! { |s| s.match /^[[:digit:]]+ / } # strip header lines

    attributes = {}
    lines.each do |line|
      id, name, flag, value, worst, threshold, type, updated, when_failed, raw = line.split
      values = {
        :id => id.to_i,
        :threshold_value => value.to_i,
        :threshold_value_worst => worst.to_i,
        :threshold_level => threshold.to_i,
        :type => type.downcase.gsub(/-/, "_").to_sym,
        :updated => updated.downcase.to_sym,
        :when_failed => when_failed,
        :raw => raw.to_i
      }
      attributes[name.downcase.gsub(/-/, "_").to_sym] = values
    end

    attributes
  end
end
