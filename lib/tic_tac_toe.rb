class TicTacToe
 WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
   ]
   
 def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
   user_input = input.to_i - 1
  end
  
  def move(index, token = "X")
     @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    @board[index] == " "
  end
  
    def turn
    puts "Please choose a number between 1-9"
    name = gets.chomp
    index_value = input_to_index(name)
    player = current_player
    if valid_move?(index_value)
      move(index_value, player)
      display_board
    else
      turn
    end
  end 
  
  def turn_count
   @board.count{|token| token == "X" || token == "O"}
  end
 
  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?	
    WIN_COMBINATIONS.any? do |combo|	
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]	
        return combo	
      end	
    end	
  end
  
end