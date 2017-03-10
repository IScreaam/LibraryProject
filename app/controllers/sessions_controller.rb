class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
  end

  def create
    redirect_to login_path, alert: 'Invalid user' and return if regular_user?
    if login(params[:email], params[:password])
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: 'Email or password invalid'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out successfully'
  end

  private

  def regular_user?
    user = User.find_by(email: params[:email])
    return unless user
    user.regular?
  end
end
