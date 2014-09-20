# tic-tac-toe.rb

FILLER_ROW = "     |     |     "
DIVIDER_ROW = "-----+-----+-----"

board_results = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}

def play_game(board_results)
  begin
    player_takes_turn(board_results)
    game_over = check_game_over(board_results)
    if game_over
      break
    else  
      computer_takes_turn(board_results)
      game_over = check_game_over(board_results)
    end  
  end until game_over
  if game_over == "Tie" 
    puts "The game ended in a tie."
  else
    puts "The game is over. The #{game_over} won."  
  end
  play_again?(board_results)
end

def display_board(results)
  system 'clear'
  puts FILLER_ROW
  puts "  #{results[1]}  |  #{results[2]}  |  #{results[3]}  "
  puts FILLER_ROW
  puts DIVIDER_ROW
  puts FILLER_ROW
  puts "  #{results[4]}  |  #{results[5]}  |  #{results[6]}  "
  puts FILLER_ROW
  puts DIVIDER_ROW
  puts FILLER_ROW
  puts "  #{results[7]}  |  #{results[8]}  |  #{results[9]}  "
  puts FILLER_ROW
  puts " "
end 

def player_takes_turn(results)
  puts "Choose a position from 1 to 9." 
  position = gets.chomp
  if results[position.to_i] == " "
    results[position.to_i] = "X"
    display_board(results)
  else
    puts "That position is already taken."
    player_takes_turn(results) 
  end   
end  

def computer_takes_turn(results)
  a = results.keys.select { |key| results[key] == " "}
  position = a.sample
  results[position] = "O"
  display_board(results)
end 

def check_game_over(results) 
  three_in_a_row_possibilities = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]] 
  three_in_a_row_possibilities.each do |row|
    if results[row[0]] == "X" && results[row[1]] == "X" && results[row[2]] == "X"  
      return "Player"
    elsif results[row[0]] == "O" && results[row[1]] == "O" && results[row[2]] == "O"  
      return "Computer"  
    end 
  end  
  if results.keys.select { |key| results[key] == " "} == []
    return "Tie" 
  end
  nil
end  

def play_again?(board_results)
  puts "Play again? (Y or N)" 
  if gets.chomp.downcase == "y"
    reset_board(board_results) 
    play_game(board_results)
  end
end     

def reset_board(results)
  results.each_key {|key| results[key] = " "}
  display_board(results)
end  

display_board(board_results)
puts "Welcome to Tic-Tac-Toe! You will be X and I will be O."
play_game(board_results)
