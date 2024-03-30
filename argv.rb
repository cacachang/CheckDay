require "optparse"
require 'optparse/date'

class Parser 
  attr_reader :input

  def initialize(input:)
    @input = input
  end

  def parse
    @output = {}
    options = OptionParser.new do |option|    
      option.banner = "Usage: example.rb [options]"
    
      option.on("-h", "--help", "Prints this help") do |v|
        puts option
        exit
      end

      option.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        @output[:v] = v
      end
    
      option.on("-c", "--color", "Enable syntax highlighting") do |c|
        @output[:c] = c
      end

      option.on("-t", "--time [Time]", DateTime, "Begin execution at given time") do |t|
        puts DateTime.parse(t.to_s).strftime("%A")
      end
    
      option.on("-name", "--name", "Require your name") do |name|
        @output[:name] = name
      end
    end.parse!

    puts @output
  end
end

Parser.new(input: ARGV).parse
