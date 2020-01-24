class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
    # @nickname = current_user.nickname
  end

  def logout
    
  end

  def payment
    
  end

  def profile_edit
    
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

