class Player
	attr_accessor :name, :life_points

	def initialize(player_name)
		@name = player_name
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(damage_points)
		@life_points = @life_points - damage_points

		if @life_points <= 0 
			puts "#{@name} est KO! Game Over..."
		end
	end

	def attacks(player_under_attack)
		puts "#{@name} attaque #{player_under_attack.name}"
		@attack_point = self.compute_damage
		puts "#{@name} lui a infligé #{@attack_point} point de dégats!" 
		player_under_attack.gets_damage(@attack_point)
	end

	def compute_damage
    	return rand(1..6)
  	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level 

	def initialize(player_name)
		@name = player_name
		@weapon_level = 1
		@life_points = 100
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}! AHAHAH"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		@dice_new_weapon = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{@dice_new_weapon}"

		if @dice_new_weapon > @weapon_level
			@weapon_level = @dice_new_weapon
			puts "Cette arme a un meilleur niveau que la tienne. Tu ramasses la super nouvelle arme badass!"
		else
			@weapon_level = @weapon_level
			puts "M*/*§! cette arme est toute pourrie... tu ne la jettes et en plus tu rates tes ennemis... de beaucoup..."
		end	  
	end

	def search_health_pack
		@dice_health_pack = rand(1..6)

		if @dice_health_pack == 1
			puts "Tu n'as rien trouvé..."
		
		elsif @dice_health_pack == 6
			puts "Waouh! tu as trouvé une grosse trousse de secours! +80 points de vie"
			@life_points = @life_points + 80
				if @life_points > 100 
					then @life_points = 100
				else
					@life_points = @life_points
				end
		else
			puts "Bravo, tu as trouvé une petite trousse de soin: +50 points de vie!"
			@life_points = @life_points + 50
				if @life_points > 100 
					then @life_points = 100
				else
					@life_points = @life_points
				end
			
		end
	end
end