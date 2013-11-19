class Car

	# Class variables that keep track of instance information
	@@total_car_count = 0
	@@car_colors = {}
	@@most_popular_color = nil

	# Sets the car color to white as a default, tank as full, resets the distance
	# Increments the total car count and most popular color for the class
	def initialize(color = "white")
		@fuel = 10
		@distance = 0
		@color = color
		@@total_car_count += 1
		if @@car_colors.include?(color)
			@@car_colors[color] += 1
		else
			@@car_colors.merge!(color => 1)
		end
	end

	# The getter version of class for car count
	def self.total_car_count
		@@total_car_count
	end

	# Arranges the hash that has collected the count of car colors and updates
	# the @@most_popular_color with the most popular color from an array of 
	# the color and its count
	def self.most_popular_color
		popular = @@car_colors.max_by { |color, count| count }
		@@most_popular_color = popular[0]
		@@most_popular_color
	end

	# Updates the color of the car and the @@car_colors hash that keeps track 
	# of color and count
	def color=(new)
		puts "The new color is #{new}."
		if @@car_colors.include?(new)
			@@car_colors[@color] -= 1
			@@car_colors[new] += 1
		else
			@@car_colors.merge!(new => 1)
		end
		@color = new
	end

	# Displays the car instance's distance and fuel information when 'puts' is used
	def to_s()
		"I'm a #{@color} car! I've driven #{@distance} and have #{@fuel} gallons of gas left."
	end

	# Determines the gas used to drive the specified distance
	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
			puts "You have #{@fuel} gallons of fuel left."
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	# Calculated the remaining gallons and cost to fill up before filling tank.
	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

# Learning about inheritance
class ConvertibleCar < Car

	def initialize(color = "red")
		super
		@roof_status = "up"
		@color = color
	end

		# Shows the roof status if car is a convertible
	def roof_status
		@roof_status
	end

	# Allows the top to go down if top is up.
	def top_down
		if @roof_status == "up"
			puts "Perfect day for it: rainy, windy, and below freezing!"
			@roof_status = "down"
		else
			puts "Looks like the roof is already down."
		end
	end

	# Allows the top to go up if top is down.
	def close_top
		if @roof_status == "down"
			puts "Good idea -- it's pretty hot out."
			@roof_status = "up"
		else
			puts "Looks like the roof is already up."
		end
	end

end

car_a = Car.new('black')
car_b = ConvertibleCar.new('blue')

car_b.close_top
car_b.top_down
# car_c = Car.new('black')
# car_d = Car.new
# puts car_d
# car_d.color = "blue"
# puts car_d
# puts Car.total_car_count
# puts Car.most_popular_color
# p car_a
# print car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
car_b.drive(117)
# puts car_a
# puts car_b