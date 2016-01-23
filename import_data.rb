file_name = ARGV.first
data_file = File.open file_name
drivers = []
data_file.each_line do |line|
  drivers.push line[7..-1].strip if line[0, 6] == 'Driver'
end

drivers.each { |driver| print "#{driver}:\n" }
