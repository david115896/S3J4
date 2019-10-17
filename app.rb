require 'bundler'
Bundler.require
$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/application'


application = Application.new

#while game.game_finished? == false && game.there_is_a_winner == false
application.perform
puts "end"
#end
