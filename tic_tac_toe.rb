# tic-tac-toe.rb

require 'pry'

FILLER_ROW = "     |     |     "
DIVIDER_ROW = "-----+-----+-----"

board_results = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}

game_board = {"top_section" => [[FILLER_ROW], ["  #{board_results[1]}  |  #{board_results[2]}  |  #{board_results[3]}  "], [FILLER_ROW], [DIVIDER_ROW]],
              "middle_section" => [[FILLER_ROW], ["  #{board_results[4]}  |  #{board_results[5]}  |  #{board_results[6]}  "], [FILLER_ROW], [DIVIDER_ROW]], 
              "bottom_section" => [[FILLER_ROW], ["  #{board_results[7]}  |  #{board_results[8]}  |  #{board_results[9]}  "], [FILLER_ROW]]}

def display_board(board)
  board.each do |key, value|
    puts value
  end 
end 

display_board(game_board)
puts "Welcome to Tic-Tac-Toe! You will be X and I will be O."
puts "Choose a position from 1 to 9." 
position = gets.chomp

board_results[position.to_i] = "X"
puts "board_results after update #{board_results}"

puts game_board

display_board(game_board)
