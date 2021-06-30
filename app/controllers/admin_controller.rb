class AdminController < ApplicationController
  def index
  	authorize
  	@time = Time.now
  	@total_orders = Order.count
  	@original_url = original_url
  end

  def original_url
	  request.path
	end
end
