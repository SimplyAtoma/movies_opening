class MoviesOpening::Movies
  attr_accessor :name, :time, :price, :available, :url
  def self.today
    movie_1 = self.new
    movie_1.name #name of movie 
    movie_1.time #time playing 
    movie_1.price #price of ticket
    movie_1.available #if the tickets are available
    movie_1.url 
  end
end