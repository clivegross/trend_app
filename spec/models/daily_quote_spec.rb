require 'spec_helper'

describe DailyQuote do

	before do
		@daily_quote  = Daily_quote.new( closing_price: 1, company_id: company.id, date: date, volume: 1 )
	end

end
