module CompanyHelper
	def neat_price(decimal)
		# use content tag style.
		decimal.round(2)
	end

	def neat_percentage(decimal)
		# use content tag for % symbol
		decimal.round(2)
	end
end
