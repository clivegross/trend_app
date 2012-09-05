class MovingAverage < ActiveRecord::Base
  attr_accessible :avg_closing_price, :company_id, :daily_quote_id, :date

  belongs_to :company
  belongs_to :daily_quote

  def self.calc_data
    # go through every record in daily_quotes table
    DailyQuote.all.each do |q|
      # get array of last 20 closing prices from record date
      # SQL query:  SELECT *, DISTINCT(dates) FROM daily_quotes
      #             WHERE company_id = quote.company_id && date <= quote.date
      #             ORDER BY date DESC LIMIT 20
      # (EDIT: has to be distinct dates too in case of duplicates  => .uniq(:date) doesnt work!!!)
      existing_record = MovingAverage.where(company_id: q.company_id, daily_quote_id: q.id)
      if existing_record.empty?
        last_20_relate = DailyQuote.where(company_id: q.company_id, date: (q.date - 100).to_date..q.date).order("date DESC").limit(20).uniq(:date)
        last_20_array = last_20_relate.map(&:closing_price)
        # calc sum of array
        last_20_sum = last_20_array.inject{|sum,x| sum + x }
        # calc number of terms in array
        # maybe make this conditional on length, if theres less than 20 records prior for the oldest
        # data its not really outputting a 20 day MA! Maybe those records should be nil???
        last_20_len = last_20_array.length
        # avg = sum/nterms
        last_20_avg = last_20_sum/last_20_len
        # create new record in db table
        self.create avg_closing_price: last_20_avg, company_id: q.company_id, daily_quote_id: q.id, date: q.date
      end
    end
  end

end
