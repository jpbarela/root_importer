When(/^I import the file '([\w.]+)'$/) do |file|
  @report = `ruby import_data.rb features/data/#{file}`
end

Then(/^I see a listing of the drivers$/) do
  drivers = @report.split("\n").map { |report_line| report_line[0, report_line.index(':')] }
  expect(drivers).to match_array %w(Alex Dan Ilya)
end

Then(/^I see the drivers sorted by distance$/) do
  drivers = @report.split("\n")
  expect(drivers).to eq ['Alex: 42 miles @ 34 mph', 'Dan: 30 miles @ 36 mph', 'Ilya: 0 miles']
end

Then(/^I see invalid trips excluded$/) do
  drivers = @report.split("\n")
  expect(drivers).to eq ['Alex: 42 miles @ 34 mph', 'Dan: 30 miles @ 36 mph', 'Ilya: 0 miles']
end
