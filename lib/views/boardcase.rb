require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)



class BoardCase
	attr_accessor :box_name, :box_value	#2 varriables par boardcase, son nom et sa valeur (vide , x ou o)
	#@@all_box_case=Array.new
	def initialize(name)
		@box_name = name	#le nom de la case est definit dans la class Board
		@box_value = ""	
	#	@@all_box_case << self
	end	


#	def self.all_boardcase_instances
#		return  @@all_box_case
#	end
	

end
