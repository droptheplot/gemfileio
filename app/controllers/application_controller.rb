class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate!
    redirect_to root_path unless current_user
  end

  def current_user
    User.where(id: session[:user_id]).try(:first) if session[:user_id]
  end
  helper_method :current_user

  def categories
    Category.all
  end
  helper_method :categories

  def notifications
    []
  end
  helper_method :notifications

  def github_oauth_path
    "https://github.com/login/oauth/authorize?client_id=#{Rails.application.secrets.github_client_id}&redirect_uri=#{users_oauth_url(:github)}"
  end
  helper_method :github_oauth_path
end
