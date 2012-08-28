class DailyQuote < ActiveRecord::Base
  attr_accessible :closing_price, :company_id, :date, :volume
end
