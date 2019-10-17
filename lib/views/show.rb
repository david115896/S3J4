require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'views/board'
require 'app/player'
require 'views/boardcase'




class Show
	attr_accessor :board_case_array
	
	def initialize(board_game_instance)
		@board_case_array = board_game_instance
		

		
	end
	
	def live_menu
                puts "Choisis une case disponible du plateau"
                num_box=1
                @board_case_array.each do |box|
                        if box.box_value == ""
                        	puts"#{num_box} - #{box.box_name}"
                        end
                        num_box += 1
                end
                print ">> "
        end

	def live_board
		system("clear")
                puts "-" * 49
                3.times do |line|
                        new_line=[]
                        if line == 0
                                new_line << @board_case_array[0].box_value   #@game_hash[:"A1"]
                                new_line << @board_case_array[1].box_value #@game_hash[:"A2"]
                                new_line << @board_case_array[2].box_value #@game_hash[:"A3"]
                        elsif line == 1
                                new_line << @board_case_array[3].box_value #@game_hash[:"B1"]
                                new_line << @board_case_array[4].box_value #@game_hash[:"B2"]
                                new_line << @board_case_array[5].box_value #@game_hash[:"B3"]
                        else
                                new_line << @board_case_array[6].box_value #@game_hash[:"C1"]
                                new_line << @board_case_array[7].box_value #@game_hash[:"C2"]
                                new_line << @board_case_array[8].box_value #@game_hash[:"C3"]
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
