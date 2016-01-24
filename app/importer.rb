require './app/driver'
require 'byebug'

class Importer
  attr_reader :drivers

  def initialize(file_name)
    @file = File.open file_name
    @drivers = []
  end

  def process
    @file.each_line do |line|
      if line[0..5] == 'Driver'
        @drivers.push Driver.new(line[7..-1].strip)
      elsif line[0..3] == 'Trip'
        process_trip_line(line)
      end
    end
  end

  private

  def parse_line(line)
    arguments = {}
    argument_array = line.split(' ')
    argument_length = argument_array.size
    arguments['name'] = argument_array[1, argument_length - 4].join(' ')
    arguments['start_time'] = argument_array[argument_length - 3]
    arguments['end_time'] = argument_array[argument_length - 2]
    arguments['miles'] = argument_array[argument_length - 1].to_f
    arguments
  end

  def process_trip_line(line)
    arguments = parse_line line
    driver = Driver.find arguments['name']
    driver.add_trip arguments['start_time'], arguments['end_time'], arguments['miles'] unless driver.nil?
  end
end
