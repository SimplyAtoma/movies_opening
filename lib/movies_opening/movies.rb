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
    movies << scrape_fandango
    
  end 
  
  def self.scrape_fandango 
    doc = Nokogiri::HTML(open("https://www.fandango.com/movies-in-theaters")) 
    binding.pry 
  end
end