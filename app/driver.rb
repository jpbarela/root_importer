class Driver

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    other.is_a?(Driver) && name == other.name
  end

  def to_s
    "#{name}:\n"
  end
end