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
    url = "https://www.fandango.com"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    binding.pry
    movie_cards = parsed_page.css("div.fluidposter")
    movie_cards.each do |movie_card|
      movie = Movies.new
      movie.name = movie_card.css("a.heading-style-1.heading-size-s.heading__movie-carousel")[0].text
      movie.url = movie_card.css('a')[0].attributes["href"].value
      movielist << movie
    end
    movielist
  end
end