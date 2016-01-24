When(/^I import the file '([\w.]+)'$/) do |file|
  @report = `ruby import_data.rb features/data/#{file}`
end

Then(/^I see a listing of the drivers$/) do
  drivers = @report.split("\n").map { |report_line| report_line[0, report_line.index(':')] }
  expect(drivers).to match_array %w(Alex Dan Ilya)
end

Then(/^I see the trip statistics for each driver$/) do
  drivers = @report.split("\n")
  expect(drivers).to match_array ['Alex: 42 miles @ 34 mph', 'Dan: 30 miles @ 36 mph', 'Ilya: 0 miles']
end

Then(/^I see the drivers sorted by distance$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see invalid trips excluded$/) do
  pending # express the regexp above with the code you wish you had
end
