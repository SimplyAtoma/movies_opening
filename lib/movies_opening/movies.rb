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
    url = "https://www.fandango.com/movies-in-theaters"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    movie_cards = parsed_page.css("div.poster-card--title-block")
    movie_cards.each do |movie_card|
      movie = Movies.new
      movie.name = first_movie.css("span.heading-style-1 browse-movielist--title poster-card--title").text
      movie.url = first_movie.css('a')[0].attributes["href"].value 
      movielist << movie
    end
    movielist
  end
end