require "optparse"
require 'optparse/date'
require './date_transform.rb'

class Parser 
  include DateTransform
  attr_reader :input

  def initialize(input:)
    @input = input
  end

  def parse
    options = OptionParser.new do |option|    
      option.banner = "Usage: example.rb [options]"
    
      option.on("-h", "--help", "Prints this help") do |v|
        puts option
        exit
      end

      option.on("-t", "--time format: 'YYYY/MM/DD'", Date, "Begin execution at given time") do |t|
        puts DateTime.parse(t.to_s).strftime("%A")
      end

      option.on("-m", "--time format: 'YYYY/MM/DD'", Date, "Transform data format to minguo date") do |t|
        puts Minguo.new(date: t).parse
      end

      option.on("-c", "--time format: 'YY/MM/DD'", String, "Transform data format to common era date") do |t|
        puts CommonEra.new(date: t).parse
      end
    end.parse!
  end
end

Parser.new(input: ARGV).parse
