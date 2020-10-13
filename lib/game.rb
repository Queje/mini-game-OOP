class Game
	attr_accessor :human_player, :enemies

	def initialize(human_player_name) 
		@human_player = HumanPlayer.new("#{human_player_name}")
		@enemies = [player1 = Player.new("player1"), player2 = Player.new("player2"), player3 = Player.new("player3"), player4 = Player.new("player4")]
	end

	def kill_player(player)
		@enemies.delete_at(player)
	end

	def is_still_ongoing?
		if human_player.life_points > 0 && !@enemies.empty?
			return true
		else
			return false
		end
	end

	def show_players
		puts "#{human_player.show_state}"
		puts "il reste #{@enemies.length} ennemis"
	end

	def menu
		puts "Quelle action veux-tu effectuer?"
		puts "                                                                                       "
		puts "                                                                                       "
		puts "a - chercher une meilleur arme"
		puts "s - chercher à se soigner"
		puts "                                                                                       "
		puts "                                                                                       "
		puts "attaquer un ennemi en vue: "
		puts "                                                                                       "
		puts "0 - attaquer enemi n°1"
		puts "1 - attaquer enemi n°2"
		puts "2 - attaquer enemi n°3"
		puts "3 - attaquer enemi n°4"
	end

	def menu_choice
		puts "Fais ton choix!"
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
		elsif answer == "2"
			human_player.attacks(player3)
		elsif answer == "3"
			human_player.attacks(player4)
		else
			puts "erreur! tu passes ton tour!"
		end
		puts "                                                                                       "
		puts "                                                                                       "		
	end

	def enemies_attack
		@enemies.each do |i|
			i.attacks(human_player)
		end
	end

	def the_end
		puts "======================================================================================================="
		puts "                                                                                                       "
		if human_player.life_points > 0 
			puts "BRAVO!!! Tu as gagné!!!"
			else
			puts "Loser! tu as perdu!!!"
		end
		puts "                                                                                                       "
		puts "======================================================================================================="
	end
end