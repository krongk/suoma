class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Override the devise default redirect path
  def after_sign_in_path_for(resource)
    traveller_groups_path
  end

end
