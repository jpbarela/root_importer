require 'spec_helper'
require './app/driver'

RSpec.describe Driver do
  let(:test_name) { 'Test' }
  let(:test_driver) { Driver.new test_name }

  describe '#initialize' do
    it 'sets the name' do
      expect(test_driver.name).to eq test_name
    end

    it 'sets the miles to 0' do
      expect(test_driver.miles).to be 0
    end

    it 'registers the driver' do
      test_driver
      expect(Driver.find('Test')).to eq test_driver
    end
  end

  describe '::find' do
    it 'returns the driver when the driver exists' do
      test_driver
      expect(Driver.find(test_name)).to eq test_driver
    end

    it "returns nil when the driver doesn't exist" do
      expect(Driver.find('Example')).to be_nil
    end
  end

  describe '#==' do
    it 'returns true when two drivers have the same name' do
      expect(test_driver == Driver.new('Test')).to be_truthy
    end

    it 'returns false when the second arguement is not a Driver' do
      expect(test_driver == 'Test').to be_falsey
    end

    it 'returns false when the second arguement has a different name' do
      expect(test_driver == Driver.new('Sam')).to be_falsey
    end
  end

  describe '#add_trip' do
    it 'adds the number of miles to the drivers total' do
      test_driver.add_trip '1:00', '1:30', 25
      expect(test_driver.miles).to be 25
    end
  end

  describe '#miles' do
    it 'rounds miles to the nearest integer' do
      test_driver.add_trip '1:00', '1:30', 25.3
      expect(test_driver.miles).to be 25
    end
  end

  describe '#speed' do
    it 'returns 0 when the driver has no trips' do
      expect(test_driver.speed).to be 0
    end

    it 'returns the rounded average speed of the driver' do
      test_driver.add_trip '1:00', '1:30', 25.3
      expect(test_driver.speed).to be 51
    end
  end

  describe '#to_s' do
    it "returns only the colon and 0 miles if the driver doesn't have any trips" do
      expect(test_driver.to_s).to eq "Test: 0 miles\n"
    end

    it 'returns the name with a colon, the average speed and the number of miles driven if the driver.miles > 0' do
      test_driver.add_trip '1:00', '1:30', 25.3
      expect(test_driver.to_s).to eq "Test: 25 miles @ 51 mph\n"
    end
  end
end
