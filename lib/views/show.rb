require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'views/board'
require 'app/player'
require 'views/boardcase'

class Show
	attr_accessor :board_case_array
	
	def initialize(board_game_instance)
		@board_case_array = board_game_instance   #recupere un array avec les ID des boardcase
	end
	
	def live_menu		#affiche un menu
                puts "Choisis une case disponible du plateau"
                num_box=1
                @board_case_array.each do |box|			#affiche seulement les cases qui sont vides
                        if box.box_value == ""
                        	puts"#{num_box} - #{box.box_name}"
                        end
                        num_box += 1
                end
                print ">> "
        end
	
	def results(player1, player2)
                puts "Voici le resultat des differentes manches :"
                puts "-"*33
                print "|"
                print "#{player1.name}".center(15)
                print "|"
                print "#{player1.score}".center(15)
                puts "|"
                puts "-"*33
                print "|"
                print "#{player2.name}".center(15)
                print "|"
                print "#{player2.score}".center(15)
                puts "|"
                puts "-"*33
	end

	def live_board
		system("clear")
                puts "-" * 49		#on ecrit la premiere ligne du tableau
                3.times do |line|	#on construit 3 lignes pour avoir 9 case
                        new_line=[]
                        if line == 0	#chaque ligne va etre remplie selon les valeurs des instances boardcase
                                new_line << @board_case_array[0].box_value
                                new_line << @board_case_array[1].box_value
                                new_line << @board_case_array[2].box_value
                        elsif line == 1
                                new_line << @board_case_array[3].box_value
                                new_line << @board_case_array[4].box_value
                                new_line << @board_case_array[5].box_value
                        else
                                new_line << @board_case_array[6].box_value
 				new_line << @board_case_array[7].box_value
                                new_line << @board_case_array[8].box_value
                        end

                        new_line.each do |letter|	#on ecrit la premier ligne de la ligne
                                print "|"
                                if letter == "O"
                                        print ("##").center(15)
                                elsif letter == "X"
                                        print ("#" + " "*(9) + "#").center(15)
                                else
                                        print (" ").center(15)
                                end
                        end
                        #puts "|"		#on ferme le tableau et on passe a la prochaine ligne
                        if line == 0
                                print "|"
                                puts "/\\".center(12)
			elsif line ==1
				print "|" 
				puts "|  _ \\".center(12)
			else
                                print "|"
				puts "./ ____|".center(12)
                        end

			
			
			
			space_circle = 4	#les formes x et O sont symetriques en horizontale et l'espace entre les # est gere par 2 variables
                        space_cross = 7
                        1.upto(2).each do |y|	#on boucle sur la moitie de la forme
                                new_line.each do |letter|	#on boucle sur chaque case de la ligne 
					print "|"
                                        if letter == "O"	#si c'est O on forme un demi cercle
                                                print ("#" + " "*(space_circle) + "#").center(15)
                                        elsif letter == "X"	#si c'est x on ferme un demi x
                                                print ("#" + " "*(space_cross) + "#").center(15)
                                        else
                                                print (" ").center(15)
                                        end			
                                end
                                y<2? space_circle += 2 : space_circle
                                space_cross -= 4
			
			if line == 0
                        	if y == 1
                                	print "|"
					puts "/  \\".center(12)
                                else
					print "|"
					puts "/ /\\ \\".center(12)
				end
			elsif line == 1
				if y == 1
					print "|"
                                        puts " | |_) |".center(12)
				else
					print "|"
					puts " |  _ <".center(12)
				end
			else
				if y == 1
					print "|"
					puts "| |   ".center(12)
				else
					print "|"
					puts "| |   ".center(12)
				end
			end

			end                        	
			
                        1.upto(2).each do |y| 	#on passe a l'autre moitie des formes
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
                        if line == 0
                                if y == 1
                                        print "|"
                                        puts "/ ____ \\".center(12)
                                else
                                        print "|"
                                        puts "/_/    \\_\\".center(12)
                                end
                        elsif line == 1
                                if y == 1
                                        print "|"
                                        puts " | |_) |".center(12)
                                else
                                        print "|"
                                        puts "|____/" .center(12)
                                end
                        else
                                if y == 1
                                        print "|"
                                        puts " | |____".center(12)
                                else
                                        print "|"
					puts "  .\\_____|".center(12)
                                end
                        end

                        
                        end
                        new_line.each do |letter|	#on fini par la derniere ligne de la case
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
                        if line == 0		
				print "-" * 49
				puts "____".center(12) 

			elsif line == 1
				print "-" * 49
				puts "______".rjust(10)
			else
				puts "-" * 49 #enfin on fait la derniere ligne du tableau

			end
		end
		puts (" __"+" "*13+" ___"+" "*14+" ____").center(50)
		puts ("/_ |"+" "*13+"|__ \\"+" "*13+"|___ \\").center(50)
		puts (" | |"+" "*16+") |"+" "*13+"__) |").center(50)
		puts (" | |"+" "*16+"/ /"+" "*13+"|__ <").center(50)
		puts (" | |"+" "*15+"/ /_"+" "*13+"___) |").center(50)
		puts (" |_|"+" "*14+"|____|"+" "*11+"|____/").center(50)
		puts ""
	end


end
