require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'views/boardcase'
require 'views/show'
require 'app/player'

class Board
	attr_accessor :board_case_name_array, :num_round, :show_instance
	@@all_board = Array.new
	def initialize
		
		a1 = BoardCase.new("A1")
                a2 = BoardCase.new("A2")
                a3 = BoardCase.new("A3")
                b1 = BoardCase.new("B1")
                b2 = BoardCase.new("B2")
                b3 = BoardCase.new("B3")
                c1 = BoardCase.new("C1")
                c2 = BoardCase.new("C2")
                c3 = BoardCase.new("C3")
		
		@board_case_name_array = [a1, a2, a3, b1, b2, b3, c1, c2 ,c3]

		@show_instance = Show.new(@board_case_name_array)
		@num_round = 0
		@@all_board << self

			
	end	
	
	def board_to_show
		@show_instance.live_board
	end

	def board_menu
		@show_instance.live_menu
	end
	
	def board_show_draw
		@show_instance.live_board
		puts "Dommage ! Aucun de vous n'a gagne .....".red
	
	end
	
	def show_result(player1, player2)
		@show_instance.results(player1, player2)
	end

	def board_who_wins(num_round, player1, player2)
		@show_instance.live_board
		if num_round%2==0
			player2.score += 1
			puts "#{player2.name} gagne la manche".green
		else
			player1.score += 1
			puts "#{player1.name} gagne la manche".green
		end	
	end

        def check_player_move(choosen_box)
                result = ""
                if choosen_box == 0 || choosen_box.between?(1,9) == false
                        result = false
                else
                        key_index = 1
                        @board_case_name_array.each do |box|
                                if key_index == choosen_box
                                        box.box_value==""? result=true : result=false
                                end
                                key_index += 1
                        end

                end
                return result
        end

        def game_move(player_sign,choosen_box)
                        key_index = 1
                        @board_case_name_array.each do |box|
                                if key_index == choosen_box
                                        box.box_value = player_sign
                                end
                                key_index += 1
                        end
        end


	def game_finished?
                boardcase_hash = Hash.new
                @board_case_name_array.each do |box|
                        boardcase_hash[box.box_name]=box.box_value
                end
                        
               if (boardcase_hash["A1"]=="" || boardcase_hash["B1"]=="" || boardcase_hash["C1"]=="" || boardcase_hash["A2"]=="" || boardcase_hash["B2"]=="" || boardcase_hash["C2"]=="" || boardcase_hash["A3"]=="" || boardcase_hash["B3"]=="" || boardcase_hash["C3"]=="") then false else true end

        end

	def there_is_a_winner
                boardcase_hash = Hash.new
                @board_case_name_array.each do |box|
                        boardcase_hash[box.box_name]=box.box_value
                end
                if (boardcase_hash["A1"]==boardcase_hash["A2"] && boardcase_hash["A2"]==boardcase_hash["A3"] && boardcase_hash["A1"]!="") || (boardcase_hash["B1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C3"] && boardcase_hash["B1"]!="") || (boardcase_hash["C1"]==boardcase_hash["C2"] && boardcase_hash["C2"]==boardcase_hash["C3"] && boardcase_hash["C1"]!="") || (boardcase_hash["A1"]==boardcase_hash["B1"] && boardcase_hash["B1"]==boardcase_hash["C1"] && boardcase_hash["A1"]!="") || (boardcase_hash["B1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["B3"] && boardcase_hash["B1"]!="") || (boardcase_hash["C1"]==boardcase_hash["C2"] && boardcase_hash["C2"]==boardcase_hash["C3"] && boardcase_hash["C1"]!="") || (boardcase_hash["A1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C3"] && boardcase_hash["A1"]!="") || (boardcase_hash["A3"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C1"] && boardcase_hash["A3"]!="") || (boardcase_hash["A1"]==boardcase_hash["B1"] && boardcase_hash["B1"]==boardcase_hash["C1"] && boardcase_hash["A1"]!="") || (boardcase_hash["A2"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C2"] && boardcase_hash["A2"]!="") || (boardcase_hash["A3"]==boardcase_hash["B3"] && boardcase_hash["B3"]==boardcase_hash["C3"] && boardcase_hash["A3"]!="") then true else false end

        end


end
