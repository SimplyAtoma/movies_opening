class MoviesOpening::Movies
  attr_accessor :name, :time, :price, :available, :url
  def self.today
     self.scrape_movies
  end
  
  def self.scrape_movies
    movies = []
    #go to fandango
    #go to area code 
    #extract properties
    movies = self.scrape_fandango
    movies
  end 
  
  def self.scrape_fandango 
    movielist = []
    parsed_page = Nokogiri::HTML(open("https://www.fandango.com"))
    movie_cards = parsed_page.search("div.fluid.poster")
    movie_cards.each do |movie_card|
      movie = self.new
      movie.name = movie_card.search("a.heading-style-1.heading-size-s.heading__movie-carousel")[0].text
      movie.time = movie_card.search("time").text
      movie.price = "$10.00"
      movie.url = movie_card.search('a')[0].attributes["href"].value
      movielist << movie
    end
    movielist
  end
end