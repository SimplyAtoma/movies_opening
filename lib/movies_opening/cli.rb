#This is the CLI Controller
class MoviesOpening::CLI
  def call 
    list_movies
    menu
  end 
  
  def list_movies
     puts "Movies playing today: "
  end 
  
  def menu
    puts "Enter the number of the movie you would like more info about: "
    input = gets.strip
  end 
end