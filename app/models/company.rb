class Company < ActiveRecord::Base
  attr_accessible :name, :ticker

  has_many :daily_quotes
  has_many :moving_averages

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
  def fetch_last_avg
    last_avg = moving_averages.order(:date).last.avg_closing_price
  end

  # calculate percentage difference between last closing price and moving avg
  def calc_last_close_pdiff
    pdiff = 100*(fetch_last_close-fetch_last_avg)/fetch_last_close
  end


end
