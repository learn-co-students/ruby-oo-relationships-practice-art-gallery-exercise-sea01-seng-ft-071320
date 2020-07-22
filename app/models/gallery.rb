class Gallery
  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name, @city = name, city
    
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Instance methods that fetch data
  def paintings
    Painting.all.select { |painting| painting.gallery == self }
  end

  def artists
    paintings.map(&:artist)
  end

  def artist_names
    artists.map(&:name)
  end

  def most_expensive_painting
    paintings.max_by(&:price)
  end
end
