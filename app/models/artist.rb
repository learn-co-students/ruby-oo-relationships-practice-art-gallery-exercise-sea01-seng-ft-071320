class Artist
  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name, @years_experience = name, years_experience
    
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Instance methods to assign data
  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end

  #Instance methods to fetch data
  def paintings
    Painting.all.select { |painting| painting.artist == self }
  end

  def galleries
    paintings.map(&:gallery)
  end

  def cities
    galleries.map(&:city)
  end

  #Class methods that aggregate data
  def self.total_experience
    all.map(&:years_experience).sum
  end
end
