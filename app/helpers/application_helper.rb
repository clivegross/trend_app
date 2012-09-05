module ApplicationHelper
  
  def ticker_links
  	# generate string containing html code to render for ticker navbar
    link_string = ''
    Company.pluck(:ticker).each do |tick|
    	link_string = link_string + '<li>' + link_to(tick, '/'+tick) + '</li>'
    end
    # mark as html safe so rails will render the string as html
    link_string.html_safe
  end
end
