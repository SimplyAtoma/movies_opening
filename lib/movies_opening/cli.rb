#This is the CLI Controller
class MoviesOpening::CLI
  def call 
    list_movies
    menu
    goodbye
  end 
  
  def list_movies
     puts "Movies playing today: "
     @movies = MoviesOpening::Movies.today
     @movies.each.with_index(i) do |movie, i|
       puts "#{i}. #{movie.name} - plays at #{movie.time} - #{movie.price} per ticket - #{movie.available}\n"
     end
  end 
  
  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the movie you would like more info about, or type list to see the list again, or type exit: "
      input = gets.strip.downcase
      if input.to_i > 0
        the_movie = @movies[input.to_i-1]
        puts "#{the_movie.name} - plays at #{the_movie.time} - #{the_movie.price} per ticket - #{the_movie.available}\n"
      elsif input == "list"
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