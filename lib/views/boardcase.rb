require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)



class BoardCase
	attr_accessor :box_name, :box_value
	@@all_box_case=Array.new
	def initialize(name)
		@box_name = name
		@box_value = ""	
		@@all_box_case << self
	end	

	def initi #remet les valeurs des cases vide
		@@all_box_case.each{|box_instance| box_instance.box_value = ""}

	end

	def self.all_boardcase_instances
		return  @@all_box_case
	end
	

end
