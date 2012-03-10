class SessionsController < ApplicationController

  skip_before_filter :signed_in_user, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
