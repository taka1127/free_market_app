class MypageController < ApplicationController
  before_action :set_user

  def index
    unless current_user.id == @user.id
      return_back and return
    end
    # @user = User.new
  end

  def profile_edit
    unless current_user.id == @user.id
      return_back and return
    end
    # @user = User.new(profile_params)
    # @user.save
  end

  def payment
    unless current_user.id == @user.id
      return_back and return
    end
  end

  def logout
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:self_introduction)
  end
end
