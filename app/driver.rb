require 'time'

class Driver
  @@drivers = {}

  attr_reader :name

  def initialize(name)
    @name = name
    @miles = 0
    @time = 0
    @@drivers[name] = self
  end

  def self.find(name)
    @@drivers[name]
  end

  def ==(other)
    other.is_a?(Driver) && name == other.name
  end

  def <=>(other)
    return nil unless other.is_a?(Driver)
    miles <=> other.miles
  end

  def add_trip(start_time, end_time, miles)
    trip_time = (Time.parse(end_time) - Time.parse(start_time)) / (60 * 60)
    return if miles / trip_time < 5 || miles / trip_time > 100
    @miles += miles
    @time += trip_time
  end

  def miles
    @miles.round
  end

  def speed
    return 0 if @time == 0
    (@miles / @time).round
  end

  def to_s
    if miles > 0
      "#{name}: #{miles} miles @ #{speed} mph\n"
    else
      "#{name}: 0 miles\n"
    end
  end
end
