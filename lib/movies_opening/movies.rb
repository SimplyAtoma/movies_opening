class MoviesOpening::Movies
  attr_accessor :name, :time, :price, :available, :url
  def self.today
     self.scrape_movies
  end
  
  def self.scrape_movies
    movies = []
    #goes to fandango
    #extract properties
    movies = self.scrape_fandango
    movies
  end 
  
  def self.scrape_fandango
    #this method is a scrapper method that goes to fandango.com
    movielist = []
    parsed_page = Nokogiri::HTML(open("https://www.fandango.com"))
    movie_cards = parsed_page.search("div.fluid.poster") #this line goes through the page and finds all the poster cards
    #which is then assigned to movie_cards to hold them all  
    movie_cards.each do |movie_card|
      movie = self.new
      movie.name = movie_card.search("a.heading-style-1.heading-size-s.heading__movie-carousel")[0].text
      movie.time = movie_card.search("time").text
      movie.price = "$10.00"
      movie.url = movie_card.search('a')[0].attributes["href"].value
      movielist << movie
      #the loop goes through the array makes a movie and assigns all the values of the name, day starts playing, price and url 
    end
    movielist
  end
end