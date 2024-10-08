class ApplicationController < ActionController::Base

  helper_method :current_chef, :logged_in?

  def current_chef
    @current_chef ||= Chef.find_by(id: session[:chef_id])
  end

  def logged_in?
    !!current_chef
  end

  def require_user
    if !logged_in?
      flash[:danger] =  "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
