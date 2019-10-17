require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/player'
require 'views/board'
require 'app/game'
require 'views/boardcase'

class Application
	attr_accessor :number_of_parties, :num_round, :board_game_instance, :player_1, :player_2
	
	def initialize

		#@board_game_instance = Board.new()
		new_players
		@num_round = 0
	end

	def perform
		welcome
		Game.new(@player_1,@player_2).perform 
				
		#@board_game_instance.board_game
		#while game_finished? == false && there_is_a_winner == false
		#Application.new(@player_1,  @player_2, @board_game_instance).perform
		#@number_of_parties += 1
		
		#end

	end

	def new_players
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
        	return player_1, player_2
	end
	
	def welcome
		print "-"*62
		puts ""
		print "|"
		print "Bienvenue sur le jeu du MORPION !".center(60)
	  	puts "|"
		print "|"
		print "Programme par David.T".center(60)
		puts "|"
		print "|"
		print "2 joueurs s'affrontent jusu'a aligner leur symbole!".center(60)
		puts "|"
           	print "|"
                print "Ce n'est pas pour les chochottes!".center(60)
                puts "|"

		print "-"*62
		puts ""
	end


end

