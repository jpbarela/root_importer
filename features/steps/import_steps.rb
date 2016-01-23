When(/^I import a file$/) do
  @report = `ruby import_data.rb features/data/sample.txt`
end

Then(/^I see a listing of the drivers$/) do
  drivers = @report.split("\n").map { |report_line| report_line[0, report_line.index(':')] }
  expect(drivers).to match_array %w(Alex Dan Ilya)
end
