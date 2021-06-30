class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    helper_method :authorize  
    private
     
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end


    protected
  
    def authorize
        @user = User.find_by_id(session[:user_id]) 
        if @user == nil
            redirect_to '/login', :notice => 'Vui lòng đăng nhập'
        end
    end

end
