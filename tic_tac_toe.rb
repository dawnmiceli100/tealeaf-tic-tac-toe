# tic-tac-toe.rb

require 'pry'

FILLER_ROW = "     |     |     "
DIVIDER_ROW = "-----+-----+-----"

board_results = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}

def display_board(results)
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
end 

display_board(board_results)
puts "Welcome to Tic-Tac-Toe! You will be X and I will be O."
puts "Choose a position from 1 to 9." 
position = gets.chomp

board_results[position.to_i] = "X"

display_board(board_results)
