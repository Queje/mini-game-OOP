require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "                                                                                       "
puts "					Bienvenue dans le duel à mort!"
puts "---------------------------------------------------------------------------------------"
puts "Voici l'état de chaque Joueur:"
puts "                                                                                       "
while player1.life_points > 0 && player2.life_points > 0
puts "                                                                                       "
puts player1.show_state
puts player2.show_state
puts "                                                                                       "
puts "Passons à la phase d'attaque!"
puts "                                                                                       "
player1.attacks(player2)
	if player2.life_points <= 0 
		then break
	else
		puts "                                                                                       "
		player2.attacks(player1)
	end
puts "---------------------------------------------------------------------------------------"
end

binding.pry
puts "The end"