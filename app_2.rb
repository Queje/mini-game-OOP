require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "======================================================================================================="
puts "// Bienvenue dans le DONJON de la MUERTE! //"
puts "Le but du jeu est d'être toujours vivant après le combat..."
puts "======================================================================================================="
puts "                                                                                                       "
puts "Quel est ton nom aventurier?"
print ">"
human_player_name = gets.chomp
human_player = HumanPlayer.new("#{human_player_name}")
puts "                                                                                                       "
puts "                                                                                                       "
puts " Prépare-toi à en découdre #{human_player_name}!"
puts "                                                                                                       "
puts "                                                                                                      "
#initialization of the ennemies
player1 = Player.new("Josiane")
player2 = Player.new("José")
array_ennemies = []
array_ennemies << player1
array_ennemies << player2
puts "Tu rencontres des ennemies: #{player1.name} et #{player2.name}"
#start the figth
puts "                                                                                                       "
puts "                                                                                                       "
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	puts "                                                                                       "
	puts human_player.show_state
	puts "                                                                                       "
	puts "                                                                                       "
	puts "Quelle action veux-tu effectuer?"
	puts "                                                                                       "
	puts "                                                                                       "
	puts "a - chercher une meilleur arme"
	puts "s - chercher à se soigner"
	puts "                                                                                       "
	puts "                                                                                       "
	puts "attaquer un ennemi en vue: "
	puts "                                                                                       "
		if player1.life_points <= 0 
			print "#{player1.name} est mort(e)!"
		else
			print "0 - " 
			puts "#{player1.show_state}" 
		end
	puts "                                                                                       "
		if player2.life_points <= 0 
			print "#{player1.name} est mort(e)!"
		else 
			print "1 - "
			puts "#{player2.show_state}"
		end
	puts "                                                                                       "
	puts "choisi!"
	print ">"
	answer = gets.chomp
	if answer == "a"
		human_player.search_weapon
	elsif answer == "s"
		human_player.search_health_pack
	elsif answer == "0"
		human_player.attacks(player1)
	elsif answer == "1"
		human_player.attacks(player2)
	else
		puts "erreur! tu passes ton tour!"
	end
	puts "                                                                                       "
	puts "                                                                                       "
		if player1.life_points > 0 && player2.life_points > 0
			puts "Les ennemis rispostent!"
		end
	array_ennemies.each do |i|
		if i.life_points > 0
			i.attacks(human_player)
		end
	end
end
	puts "                                                                                                       "
	puts "                                                                                                       "
	if human_player.life_points > 0 
		puts "BRAVO!!! Tu as gagné!!!"
		else
		puts "Loser! tu as perdu!!!"
	end
puts "                                                                                                       "
puts "======================================================================================================="
