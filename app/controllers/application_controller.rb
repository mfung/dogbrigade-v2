class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def list_custom_dog_breeds

  end
  def list_dog_breeds
  	@dog_breeds ||= dog_breeds
  end
  protected
  def dog_breeds
    if current_user #&& current_user.try(:favorite_breeds).present?
      ['German Shepard']
    else
      PetGateway.new.breeds
    end
  end
  helper_method :current_user, :list_dog_breeds
end
