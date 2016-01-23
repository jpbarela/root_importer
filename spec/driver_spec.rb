require 'spec_helper'
require './app/driver'

RSpec.describe Driver do
  describe '#initialize' do
    it 'sets the name' do
      driver = Driver.new 'Dan'
      expect(driver.name).to eq 'Dan'
    end
  end

  describe '#==' do
    let(:test_driver){ Driver.new 'Dan'}

    it 'returns true when two drivers have the same name' do
      expect(test_driver == Driver.new('Dan')).to be_truthy
    end

    it 'returns false when the second arguement is not a ' do
      expect(test_driver == 'Dan').to be_falsey
    end

    it 'returns false when the second arguement has a different name' do
      expect(test_driver == Driver.new('Sam')).to be_falsey
    end
  end

  describe '#to_s' do
    it 'returns the name with a colon' do
      driver_dan = Driver.new 'Dan'
      expect(driver_dan.to_s).to eq "Dan:\n"
    end
  end
end