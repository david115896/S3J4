require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/player'
require 'views/board'
require 'app/game'
require 'views/boardcase'

class Application
	attr_accessor :player_1, :player_2, :next_party
	
	def initialize
		new_players
		@next_party ="y"
	end

	def perform
		while @next_party == "y"
			Game.new(@player_1,@player_2).perform
		        
			puts "Souhaitez vous refaire une partie ? y/n".yellow
             		print ">> "
			@next_party = gets.chomp
			while @next_party!= "y" && @next_party!= "n"
				puts"Je n'ai pas compris votre choix. Merci de repondre y ou n. ".red
	                        print ">> "
        	                @next_party = gets_chomp
                	end
		end
	end

	def new_players
                system("clear")
		welcome
                puts "Pour commencer, quel est le blaze du premier joueur ?"
                print ">>"
                player1 = gets.chomp
		while player1==""
			puts "Sois sympas, donne moi un petit nom"
			print ">> "
			player1 = gets.chomp
		end
                @player_1 = Player.new(player1, "X")
                system ("clear")
		puts "La classe #{@player_1.name}, tu as un blaze de winner ! Tu as toutes les chances de gagner "
                puts "Tu joueras avec les 'X'"

                puts "Maintenant, quel est le blaze du deuxieme joueur le loozer ?"
                print ">>"
                player2 = gets.chomp
                while player2==""
                        puts "Sois sympas, donne moi un petit nom"
                        print ">> "
                        player2 = gets.chomp
                end

		@player_2 = Player.new(player2, "O")
                system ("clear")
		puts "#{@player_2.name}, c'est quoi ce nom de loozer ??? WTF !! Pour la peine, tu joueras toujours apres #{@player_1.name}!"
                puts "Tu joueras avec les 'O' .... enfin si tu sais jouer bien entendu ... "
                print "ok ?"
                gets
                system( "clear")
	end
	
	def welcome
		print "-"*62
		puts ""
		print "|"
		print "Bienvenue sur le jeu du MORPION !".center(60)
	  	puts "|"
		print "|"
		print "Programme par David.T et Viktor.P".center(60)
		puts "|"
		print "|"
		print "2 joueurs s'affrontent jusqu'a aligner leur symbole!".center(60)
		puts "|"
           	print "|"
                print "Ce n'est pas pour les chochottes!".center(60)
                puts "|"

		print "-"*62
		puts ""
	end
end

