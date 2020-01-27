class MypageController < ApplicationController
  before_action :set_user

  def index
    unless current_user.id == @user.id
      return_back and return
    end
  end

  def profile_edit
    unless current_user.id == @user.id
      return_back and return
    end
    @user.update(profile_params)
    redirect_to profile_mypage_index_path(current_user.id)
  end

  def payment
    unless current_user.id == @user.id
      return_back and return
    end
  end

  def register
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
