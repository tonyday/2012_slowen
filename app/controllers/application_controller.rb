class ApplicationController < ActionController::Base

  protect_from_forgery
  include SessionsHelper

  before_filter :signed_in_user

  private

  def signed_in_user
    redirect_to signin_path, notice: 'Please sign in.' unless signed_in?
  end

end
