require './app/driver'

class Importer

  attr_reader :drivers

  def initialize(file_name)
    @file = File.open file_name
    @drivers = []
  end

  def process
    @file.each_line do |line|
      @drivers.push Driver.new(line[7..-1].strip) if line[0..5] == 'Driver'
    end
  end
end