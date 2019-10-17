require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'views/boardcase'
require 'views/show'

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
	
	def self.first_board
		return @@all_board[0]

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
                #puts boardcase_hash
                        
               if (boardcase_hash["A1"]=="" || boardcase_hash["B1"]=="" || boardcase_hash["C1"]=="" || boardcase_hash["A2"]=="" || boardcase_hash["B2"]=="" || boardcase_hash["C2"]=="" || boardcase_hash["A3"]=="" || boardcase_hash["B3"]=="" || boardcase_hash["C3"]=="") then false else true end

                #if @game_hash[:"A1"]==""|| @game_hash[:"B1"]==""|| @game_hash[:"C1"]==""|| @game_hash[:"A2"]==""|| @game_hash[:"B2"]==""|| @game_hash[:"C2"]==""|| @game_hash[:"A3"]==""|| @game_hash[:"B3"]==""|| @game_hash[:"C3"]=="" then false else true end

        end

	def there_is_a_winner
                boardcase_hash = Hash.new
                @board_case_name_array.each do |box|
                        boardcase_hash[box.box_name]=box.box_value
                end
                if (boardcase_hash["A1"]==boardcase_hash["A2"] && boardcase_hash["A2"]==boardcase_hash["A3"] && boardcase_hash["A1"]!="") || (boardcase_hash["B1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C3"] && boardcase_hash["B1"]!="") || (boardcase_hash["C1"]==boardcase_hash["C2"] && boardcase_hash["C2"]==boardcase_hash["C3"] && boardcase_hash["C1"]!="") || (boardcase_hash["A1"]==boardcase_hash["B1"] && boardcase_hash["B1"]==boardcase_hash["C1"] && boardcase_hash["A1"]!="") || (boardcase_hash["B1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["B3"] && boardcase_hash["B1"]!="") || (boardcase_hash["C1"]==boardcase_hash["C2"] && boardcase_hash["C2"]==boardcase_hash["C3"] && boardcase_hash["C1"]!="") || (boardcase_hash["A1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C3"] && boardcase_hash["A1"]!="") || (boardcase_hash["A3"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C1"] && boardcase_hash["A3"]!="") || (boardcase_hash["A1"]==boardcase_hash["B1"] && boardcase_hash["B1"]==boardcase_hash["C1"] && boardcase_hash["A1"]!="") || (boardcase_hash["A2"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C2"] && boardcase_hash["A2"]!="") || (boardcase_hash["A3"]==boardcase_hash["B3"] && boardcase_hash["B3"]==boardcase_hash["C3"] && boardcase_hash["A3"]!="") then true else false end


#                if (@game_hash[:"A1"]==@game_hash[:"A2"] && @game_hash[:"A2"]==@game_hash[:"A3"] && @game_hash[:"A1"]!="") || (@game_hash[:"B1"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C3"] && @game_hash[:"B1"]!="") || (@game_hash[:"C1"]==@game_hash[:"C2"] && @game_hash[:"C2"]==@game_hash[:"C3"] && @game_hash[:"C1"]!="") || (@game_hash[:"A1"]==@game_hash[:"B1"] && @game_hash[:"B1"]==@game_hash[:"C1"] && @game_hash[:"A1"]!="") || (@game_hash[:"B1"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"B3"] && @game_hash[:"B1"]!="") || (@game_hash[:"C1"]==@game_hash[:"C2"] && @game_hash[:"C2"]==@game_hash[:"C3"] && @game_hash[:"C1"]!="") || (@game_hash[:"A1"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C3"] && @game_hash[:"A1"]!="") || (@game_hash[:"A3"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C1"] && @game_hash[:"A3"]!="") || (@game_hash[:"A1"]==@game_hash[:"B1"] && @game_hash[:"B1"]==@game_hash[:"C1"] && @game_hash[:"A1"]!="") || (@game_hash[:"A2"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C2"] && @game_hash[:"A2"]!="") || (@game_hash[:"A3"]==@game_hash[:"B3"] && @game_hash[:"B3"]==@game_hash[:"C3"] && @game_hash[:"A3"]!="") then true else false end

        end











	def board_menu_delete
	        puts "Choisis une case disponible du plateau"
                num_box=1
                @boardcase_name.each do |box|        
			if box.box_value == ""
                #if @game_hash[key]==""
                                puts"#{num_box} - #{box.box_name}"
                        #puts "#{num_box} - case #{key}"
                        end
                        num_box += 1
                end
                print ">> "
        end



	def board_game_delete
                system("clear")
                puts "-" * 49
                3.times do |line|
                        new_line=[]
                        if line == 0
				new_line << @boardcase_name[0].box_value   #@game_hash[:"A1"]
				new_line << @boardcase_name[1].box_value #@game_hash[:"A2"]
				new_line << @boardcase_name[2].box_value #@game_hash[:"A3"]
                        elsif line == 1
				new_line << @boardcase_name[3].box_value #@game_hash[:"B1"]
				new_line << @boardcase_name[4].box_value #@game_hash[:"B2"]
				new_line << @boardcase_name[5].box_value #@game_hash[:"B3"]
                        else
				new_line << @boardcase_name[6].box_value #@game_hash[:"C1"]
				new_line << @boardcase_name[7].box_value #@game_hash[:"C2"]
				new_line << @boardcase_name[8].box_value #@game_hash[:"C3"]
                        end

                        new_line.each do |letter|
                                print "|"
                                if letter == "O"
                                        print ("##").center(15)
                                elsif letter == "X"
                                        print ("#" + " "*(9) + "#").center(15)
                                else
                                        print (" ").center(15)
                                end
                        end
                        puts "|"
                        space_circle = 4
                        space_cross = 7
                        1.upto(2).each do |y|
                                new_line.each do |letter|
                                        print "|"
					if letter == "O"
                                                print ("#" + " "*(space_circle) + "#").center(15)
                                        elsif letter == "X"
                                                print ("#" + " "*(space_cross) + "#").center(15)
                                        else
                                                print (" ").center(15)
                                        end
                                end
                                y<2? space_circle += 2 : space_circle
                                space_cross -= 4

                                puts "|"
                        end

                        1.upto(2).each do |y|
                                space_cross += 4
                                new_line.each do |letter|
                                        print "|"
                                        if letter == "O"
                                                print ("#" + " "*(space_circle) + "#").center(15)
                                        elsif letter == "X"
                                                print ("#" + " "*(space_cross) + "#").center(15)
                                        else
                                                print (" ").center(15)
                                        end
                                end
                        space_circle -= 2
                        puts "|"
                        end
                        new_line.each do |letter|
                                print "|"
                                if letter == "O"
                                        print ("##").center(15)
                                elsif letter == "X"
                                        print ("#" + " "*(9) + "#").center(15)
                                else
                                        print (" ").center(15)
				end
                        end
                        puts "|"
                        puts "-" * 49
                        end
                end
end
