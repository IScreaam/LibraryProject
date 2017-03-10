class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]

  def index
    @users = User.regular.includes(:books).order(:first_name)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: 'User successfully created'
    else
      redirect_to new_user_path, alert: @user.errors.values.join(', ')
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'User successfully updated'
    else
      redirect_back_or_to(user_path(@user), alert: 'Can not update the user')
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'User successfully deleted'
    else
      redirect_to user_path(@user), alert: 'Can not delete the user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 picture_attributes: picture_attributes
    )
  end

  def picture_attributes
    [:picture, :id]
  end

  def set_user
    @user = User.find(params[:id])
  end
end
