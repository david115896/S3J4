require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)



class BoardCase
	attr_accessor :box_name, :box_value	#2 varriables par boardcase, son nom et sa valeur (vide , x ou o)
	def initialize(name)
		@box_name = name	#le nom de la case est definit dans la class Board
		@box_value = ""	
	end	

end
