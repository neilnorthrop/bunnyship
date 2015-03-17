class Validator

	attr_accessor :game

	def initialize(game)
	  @game = game
	end

	# def validate_input(opts)
	# 	type 			= opts[:type]
	# 	x 				= opts[:x]
	# 	y 				= opts[:y]
	# 	alignment = opts[:alignment]
	#   valid?(input)
	# end

	def valid_type?(type)
		game.ships.has_key?(type)
	end

	def x_exists?(x)
		x <= game.grid.width && x > 0
	end

	def y_exists?(y)
		y <= game.grid.height && y > 0
	end

	def valid_width?(x, ship_length)
		(x + ship_length - 1) <= game.grid.width
	end

	def valid_height?(y, ship_length)
		(y + ship_length - 1) <= game.grid.height
	end

end
