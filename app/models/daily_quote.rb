class DailyQuote < ActiveRecord::Base
  attr_accessible :closing_price, :company_id, :date, :volume

  belongs_to :company

  validates_presence_of :closing_price, :company_id, :date
  #validates uniqueness: true

  def self.destroy_old_data
    # We are only keeping data up to 1 year old
    date_limit = Date.today-366
    date_oldest = DailyQuote.order("date ASC").first.date
    # SQL query:  SELECT "daily_quotes".*
    #             FROM "daily_quotes"
    #             WHERE ("daily_quotes"."date" BETWEEN date_oldest AND date_limit)
    self.where(date: date_oldest..date_limit).destroy_all
  end

  # fetches stock data for a company from API and stores in daily_quotes table
  def self.fetch_data(company)
    url = 'http://dev.markitondemand.com/Api/Timeseries/json'
    jsondata = RestClient.get(url, params: {symbol: company.ticker})

    parsed_json = JSON.parse(jsondata)
    value_array = parsed_json["Data"]["Series"]["close"]["values"]
    date_array = parsed_json["Data"]["SeriesDates"]

    # only add records not already in table
    # SELECT "daily_quotes".* FROM "daily_quotes" WHERE "daily_quotes"."company_id" = 3
    dates_have = self.where(company_id: company.id).map(&:date)

    value_array.each_with_index do |value, index|
      # only add records that dont match any date in array 'dates_have'
      unless dates_have.include?(date_array[index].to_date)
        self.create company_id: company.id, closing_price: value, date: date_array[index]
      end
    end
  end

  def self.destroy_duplicates
    # insert code
  end
end

# Company.all.each do |company|
