require './app/importer'
require 'pry'

file_name = ARGV.first
import = Importer.new file_name
import.process

import.drivers.each { |driver| print driver }
