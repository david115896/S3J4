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
		

		while @board_game_instance.game_finished? == false && @board_game_instance.there_is_a_winner == false    #boucle tant que les conditions de fin ne sont pas respectes
			if @num_round == 0    #Debut de la partie
				puts "Bon vous connaissez les regles ..... enfin peut etre pas #{@player_2.name} .... mais on s'en fout"
                        	puts "Que le meilleur gagne !!"
                        	puts "presse ENTRER pour continuer"
                       		puts gets
                	end
			@board_game_instance.board_to_show      #affiche le tableau de jeu  vierge
		         
			if @num_round%2==0 then 		#le joueur 1 joue toujours en premier et donc joue aux tours pairs
				puts "C'est au tour de #{@player_1.name}"
				@board_game_instance.board_menu		#affiche son menu de selection selon l'avancement du jeu
				choosen_box = gets.chomp.to_i		#recupere le choix du joueur
				while @board_game_instance.check_player_move(choosen_box) == false		#verifie que le joueur selectionne un choix valide
                	                if choosen_box.between?(1,9)
						puts "cette case n'est pas disponible, choisis en une autre".yellow
                                	else
						puts "He, tu ne sais pas lire ??? Choisis un nombre entre 1 et 9, et qui soit encore disponible".red
        	                        end
					print ">> "
					choosen_box = gets.chomp.to_i			#relance le joueur pour saisir un choix valide
	                        end
				@board_game_instance.game_move("X",choosen_box)			#envoie son choix pour remplir le tableau

                 	else			#la meme chose pour player 2 aux tours impaires
				puts "c'est au tour de #{@player_2.name}"
	                        @board_game_instance.board_menu
        	                choosen_box = gets.chomp.to_i
				while @board_game_instance.check_player_move(choosen_box) == false
                        	        if choosen_box.between?(1,9)
						puts "cette case n'est pas disponible, choisis en une autre".yellow
	                                else
						puts "Ca ne m'etonne pas de toi, tu n'as rien compris au jeu .... Choisis un nombre entre 1 et 9, et qui soit encore disponible".red
                	                end
                        	        print ">> "
					choosen_box = gets.chomp.to_i
	                        end
				@board_game_instance.game_move("O",choosen_box)

                	end
        		@num_round += 1		
		end
		system("clear")
		if @board_game_instance.game_finished? == true
			@board_game_instance.board_show_draw
		else
			@board_game_instance.board_who_wins(@num_round, @player_1, @player_2)
		end
		@board_game_instance.show_result(@player_1, @player_2)

	end


	def show_result
		puts "Voici le resultats des differentes manches :"
		puts "-"*30
		print "|"
		print "#{@player_1.name}".center(15)
		print "|"
		print "#{@player_1.score}".center(15)
		puts "|"
		puts "-"*30
		print "|"
                print "#{@player_1.name}".center(15)
                print "|"
                print "#{@player_1.score}".center(15)
                puts "|"
                puts "-"*30
	
	end
end
