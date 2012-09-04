module CompanyHelper
  def neat_price(decimal)
    # use content tag style.
    '$ ' + decimal.round(2).to_s
  end

  def neat_percentage(decimal)
    # use content tag for % symbol
    decimal.round(2).to_s + ' %'
  end

  def js_series_builder(x_array, y_array)
    chart_array = [];
    y_array.each_with_index do |price, index|
      chart_array[index] = [x_array[index], price]
    end
  end
  
  def y_max(array)
    array.max * 1.02
  end

  def y_min(array)
    array.min * 0.95
  end
end
