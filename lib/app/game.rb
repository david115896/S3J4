require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'views/board'
require 'app/player'
require 'views/boardcase'


class Game
	attr_accessor :num_round, :player_1, :player_2, :board_game_instance

	def initialize(first_player, second_player)
		@num_round = 0
		@player_1 = first_player
		@player_2 = second_player
		@board_game_instance = Board.new
	end	
	
	def perform
		
		while @board_game_instance.game_finished? == false && @board_game_instance.there_is_a_winner == false
			if @num_round == 0
                        	puts "Bon vous connaissez les regles ..... enfin peut etre pas #{@player_2} .... mais on s'en fout"
                        	puts "Que le meilleur gagne !!"
                        	puts "presse ENTRER pour continuer"
                       	puts gets
                	end
			@board_game_instance.board_to_show
		         
			if @num_round%2==0 then
                        puts "C'est au tour de #{@player_1}"
			
			@board_game_instance.board_menu
			
			choosen_box = gets.chomp.to_i
			while @board_game_instance.check_player_move(choosen_box) == false
                                if choosen_box.between?(1,9)
                                        puts "cette case n'est pas disponible, choisis en une autre"
                                else
                                        puts "He, tu ne sais pas lire ??? Choisis un nombre entre 1 et 9, et qui soit encore disponible"
                                end
                                choosen_box = gets.chomp.to_i

                        end
			@board_game_instance.game_move("X",choosen_box)

                 else
                        puts "c'est au tour de #{@player_2}"
                        @board_game_instance.board_menu
                        choosen_box = gets.chomp.to_i
			while @board_game_instance.check_player_move(choosen_box) == false
                                if choosen_box.between?(1,9)
                                        puts "cette case n'est pas disponible, choisis en une autre"
                                else
                                        puts "He, tu ne sais pas lire ??? Choisis un nombre entre 1 et 9, et qui soit encore disponible"
                                end
                                choosen_box = gets.chomp.to_i
                        end
			@board_game_instance.game_move("O",choosen_box)

                end
        	@num_round += 1
		end
	end



        def new_players2333
                system("clear")
                puts "Pour commencer, quel est le blaze du premier joueur ?"
                print ">>"
                @player_1 = gets.chomp
                player1 = Player.new(@player_1, "X")
                system ("clear")
                puts "La classe #{@player_1}, tu as un blaze de winner ! Tu as toutes les chances de gagner "
                puts "Tu joueras avec les 'X'"

                puts "Maintenant, quel est le blaze du deuxieme joueur le loozer ?"
                print ">>"
                @player_2 = gets.chomp
                player2 = Player.new(@player_2, "O")
                system ("clear")
                puts "#{@player_2}, c'est quoi ce nom de loozer ??? WTF !! Pour la peine, tu joueras toujours apres #{@player_1}!"
                puts "Tu joueras avec les 'O' .... enfin si tu sais jouer bien entendu ... "
                print "ok ?"
                gets
                system( "clear")
        end



        def game_finished_to_delete
		boardcase_hash = Hash.new
		@board_game_instance.boardcase_name.each do |box|
			boardcase_hash[box.box_name]=box.box_value
		end
		#puts boardcase_hash
			
               if (boardcase_hash["A1"]=="" || boardcase_hash["B1"]=="" || boardcase_hash["C1"]=="" || boardcase_hash["A2"]=="" || boardcase_hash["B2"]=="" || boardcase_hash["C2"]=="" || boardcase_hash["A3"]=="" || boardcase_hash["B3"]=="" || boardcase_hash["C3"]=="") then false else true end

	       	#if @game_hash[:"A1"]==""|| @game_hash[:"B1"]==""|| @game_hash[:"C1"]==""|| @game_hash[:"A2"]==""|| @game_hash[:"B2"]==""|| @game_hash[:"C2"]==""|| @game_hash[:"A3"]==""|| @game_hash[:"B3"]==""|| @game_hash[:"C3"]=="" then false else true end

        end

        def there_is_a_winner_to_delete
		boardcase_hash = Hash.new
                BoardCase.all_boardcase_instances.each do |box|
                        boardcase_hash[box.box_name]=box.box_value
                end
		if (boardcase_hash["A1"]==boardcase_hash["A2"] && boardcase_hash["A2"]==boardcase_hash["A3"] && boardcase_hash["A1"]!="") || (boardcase_hash["B1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C3"] && boardcase_hash["B1"]!="") || (boardcase_hash["C1"]==boardcase_hash["C2"] && boardcase_hash["C2"]==boardcase_hash["C3"] && boardcase_hash["C1"]!="") || (boardcase_hash["A1"]==boardcase_hash["B1"] && boardcase_hash["B1"]==boardcase_hash["C1"] && boardcase_hash["A1"]!="") || (boardcase_hash["B1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["B3"] && boardcase_hash["B1"]!="") || (boardcase_hash["C1"]==boardcase_hash["C2"] && boardcase_hash["C2"]==boardcase_hash["C3"] && boardcase_hash["C1"]!="") || (boardcase_hash["A1"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C3"] && boardcase_hash["A1"]!="") || (boardcase_hash["A3"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C1"] && boardcase_hash["A3"]!="") || (boardcase_hash["A1"]==boardcase_hash["B1"] && boardcase_hash["B1"]==boardcase_hash["C1"] && boardcase_hash["A1"]!="") || (boardcase_hash["A2"]==boardcase_hash["B2"] && boardcase_hash["B2"]==boardcase_hash["C2"] && boardcase_hash["A2"]!="") || (boardcase_hash["A3"]==boardcase_hash["B3"] && boardcase_hash["B3"]==boardcase_hash["C3"] && boardcase_hash["A3"]!="") then true else false end
		

#                if (@game_hash[:"A1"]==@game_hash[:"A2"] && @game_hash[:"A2"]==@game_hash[:"A3"] && @game_hash[:"A1"]!="") || (@game_hash[:"B1"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C3"] && @game_hash[:"B1"]!="") || (@game_hash[:"C1"]==@game_hash[:"C2"] && @game_hash[:"C2"]==@game_hash[:"C3"] && @game_hash[:"C1"]!="") || (@game_hash[:"A1"]==@game_hash[:"B1"] && @game_hash[:"B1"]==@game_hash[:"C1"] && @game_hash[:"A1"]!="") || (@game_hash[:"B1"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"B3"] && @game_hash[:"B1"]!="") || (@game_hash[:"C1"]==@game_hash[:"C2"] && @game_hash[:"C2"]==@game_hash[:"C3"] && @game_hash[:"C1"]!="") || (@game_hash[:"A1"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C3"] && @game_hash[:"A1"]!="") || (@game_hash[:"A3"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C1"] && @game_hash[:"A3"]!="") || (@game_hash[:"A1"]==@game_hash[:"B1"] && @game_hash[:"B1"]==@game_hash[:"C1"] && @game_hash[:"A1"]!="") || (@game_hash[:"A2"]==@game_hash[:"B2"] && @game_hash[:"B2"]==@game_hash[:"C2"] && @game_hash[:"A2"]!="") || (@game_hash[:"A3"]==@game_hash[:"B3"] && @game_hash[:"B3"]==@game_hash[:"C3"] && @game_hash[:"A3"]!="") then true else false end

        end


end
