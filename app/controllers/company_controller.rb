class CompanyController < ApplicationController
  def list
  	@companies = Company.find(:all)
  end

  def show
  	@company = Company.find(params[:id])
  	@last_close = @company.fetch_last_close
  	@last_close_ma = @company.calc_last_close_ma
  	@pct_diff = @company.calc_last_close_pdiff
  	@close_array = DailyQuote.where(company_id: @company.id).map(&:closing_price)
  	@date_array = DailyQuote.where(company_id: @company.id).limit(@close_array.length).map(&:date)
  	@moving_avg_array = MovingAverage.where(company_id: @company.id).limit(@close_array.length).map(&:avg_closing_price)
  end
end
