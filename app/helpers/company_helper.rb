module CompanyHelper
	def neat_price(decimal)
		# use content tag style.
		decimal.round(2)
	end

	def neat_percentage(decimal)
		# use content tag for % symbol
		decimal.round(2)
	end

	def js_series_builder(x_array, y_array)
		chart_array = [];
		y_array.each_with_index do |price, index|
			chart_array[index] = [x_array[index], price]
		end
	end

		

end
