class Painting
  attr_reader :title, :price, :artist
  attr_accessor :gallery

  @@all = []

  def initialize(title, price, artist, gallery=nil)
    @title, @price, @artist, @gallery = title, price, artist, gallery
    
    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Class methods that aggregate data
  def self.total_price
    all.map(&:price).sum
  end
end
