require 'spec_helper'
require './app/importer'

RSpec.describe Importer do
  describe '#initialize' do
    let(:file_name) { 'example.txt' }
    let(:importer) { Importer.new file_name }

    it 'sets the drivers to an empty array' do
      allow(File).to receive(:open)
      expect(importer.drivers).to eq []
    end

    it 'opens the file with the file name' do
      expect(File).to receive(:open).with(file_name)
      importer
    end
  end

  describe '#process' do
    context 'when a Driver line is read' do
      let(:importer) { Importer.new 'example.txt' }

      before do
        data = instance_double(File)
        allow(data).to receive(:each_line).and_yield('Driver Dan')
        allow(File).to receive(:open) { data }
      end

      it 'creates a new driver' do
        expect(Driver).to receive(:new).with('Dan')
        importer.process
      end

      it 'adds the driver to the driver array' do
        importer.process
        expect(importer.drivers).to eq [Driver.new('Dan')]
      end
    end

    context 'when a Trip line is read' do
      it 'adds the trip to the Driver when the trip is associated to an existing Driver' do
        data = instance_double(File)
        allow(data).to receive(:each_line).and_yield('Trip Dan 07:15 07:45 17.3')
        allow(File).to receive(:open) { data }
        test_driver = Driver.new 'Dan'
        importer = Importer.new 'example.txt'
        importer.process
        expect(test_driver.miles).to be 17
      end
    end
  end
end
