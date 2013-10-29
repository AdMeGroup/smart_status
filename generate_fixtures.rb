#!/usr/bin/env ruby

require 'smart_status'

fixtures = File.read('spec/fixtures/output.txt')

attrs = SMARTStatus::Parser.parse_lines(fixtures)
attrs.each do |name,attr|
  print ":#{name} => "
  p( { :id => attr.id, :raw_name => attr.raw_name, :formatted_name => attr.formatted_name, :threshold_value => attr.threshold_value, 
       :threshold_value_worst => attr.threshold_value_worst, :threshold_level =>  attr.threshold_level, :type => attr.type,
       :unit => attr.unit, :updated => attr.updated, :raw => attr.raw, :when_failed => attr.when_failed
  } )
end
