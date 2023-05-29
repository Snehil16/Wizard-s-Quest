class Room
  attr_reader :name

  def initialize(name, description)
    @name = name
    @description = description
  end

  def describe
    puts "\n--------"
    puts @description
  end
end
