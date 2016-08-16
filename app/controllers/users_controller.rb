class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  def download_file
    @user = User.find(params[:id])
    send_file(@user.avatar.path,
      :type => 'image/png',
      :disposition => 'attachment',
      :url_based_filename => true)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, {gallery_photos: []}, :avatar)
  end

end
