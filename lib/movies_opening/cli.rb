#This is the CLI Controller
class MoviesOpening::CLI
  def call 
    list_movies
    menu
    goodbye
  end 
  
  def list_movies
     puts "Movies playing today: "
     MoviesOpening::Movies.today
  end 
  
  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the movie you would like more info about, or type list to see the list again, or type exit: "
      input = gets.strip.downcase
      case input
      when "1"
        
      when "2"
        
      when "3"
        
      when "list"
        list_movies
      else 
        puts "Not sure what you want, type list or exit."
      end 
    end
  end 
  
  def goodbye
    puts "See you tomorrow for more movie times!!"
  end
end