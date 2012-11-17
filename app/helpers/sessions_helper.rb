module SessionsHelper

  def get_cart
    if session[:cart]
      return session[:cart]
    else
      session[:cart] = Cart.new
      return session[:cart]
    end
  end
  
  def clear_cart
    @cart = get_cart
    @cart.clear
  end
  
  def view_cart
	@cart = get_cart
  end
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    @current_user = user
  end
  
  def get_current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !get_current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
  end
  
  def is_current_user(user)
    return true if user == @current_user
	false
  end
  
  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
	
	def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end
