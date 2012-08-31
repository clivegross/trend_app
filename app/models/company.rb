class Company < ActiveRecord::Base
  attr_accessible :name, :ticker

  has_many :daily_quotes

  validates_presence_of :name, :ticker

  # should fetch from API the daily quotes
  # for the last 365 days for a company and store in Daily_quotes db table
  # def fetch_data

  #   # first empty database (inefficient! fix this later)
  #   DailyQuote.destoy_all

  #   url = 'http://dev.markitondemand.com/Api/Timeseries/json'
  #   jsondata = RestClient.get(url, params: { symbol: company.ticker })

  #   parsed_json = JSON.parse( jsondata )
  #   value_array = parsed_json["Data"]["Series"]["close"]["values"]
  #   date_array = parsed_json["Data"]["SeriesDates"]

  #   need to catch errors!!!

  # fetch the last closing price for a company from daily_quotes db table
  def fetch_last_close
    last_close = daily_quotes.order(:date).last.closing_price
  end

  # calculate the 20 day moving average for the last closing price for as company
  def calc_last_close_ma
    # get array of last 20 closing prices
    last_20_array = daily_quotes.order("date DESC").limit(20).map(&:closing_price)
    # calc sum of array
    last_20_sum = last_20_array.inject{|sum,x| sum + x }
    # calc number of terms in array
    last_20_len = last_20_array.length
    # avg = sum/nterms
    last_20_avg = last_20_sum/last_20_len
  end

  # calculate percentage difference between last closing price and moving avg
  def calc_last_close_pdiff
    pdiff = 100*(fetch_last_close-calc_last_close_ma)/fetch_last_close
  end


end
