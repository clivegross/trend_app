class DailyQuoteController < ApplicationController

 def list
    @daily_quotes = daily_quote.find(:all)
 end

 def show
    @daily_quote = daily_quote.find(params[:id])
 end

 def new
    @daily_quote = daily_quote.new
    @subjects = Subject.find(:all)
 end

 def create
    @daily_quote = daily_quote.new(params[:daily_quote])
    if @daily_quote.save
          redirect_to :action => 'list'
    else
          @subjects = Subject.find(:all)
          render :action => 'new'
    end
 end

 def edit
    @daily_quote = daily_quote.find(params[:id])
    @subjects = Subject.find(:all)
 end

 def update
    @daily_quote = daily_quote.find(params[:id])
    if @daily_quote.update_attributes(params[:daily_quote])
       redirect_to :action => 'show', :id => @daily_quote
    else
       @subjects = Subject.find(:all)
       render :action => 'edit'
    end
 end

 def delete
    daily_quote.find(params[:id]).destroy
    redirect_to :action => 'list'
 end
 
 def show_subjects
    @subject = Subject.find(params[:id])
 end

end
