class SignupController < ApplicationController
  def session1
    @user = User.new # 新規インスタンス作成
  end

  def session2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:name] = user_params[:name]
    session[:name_kana] = user_params[:name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new # 新規インスタンス作成
  end
  def session3
    # step1で入力された値をsessionに保存
    session[:tel] = user_params[:tel]
    @user = User.new # 新規インスタンス作成
  end
  def session4
    # step1で入力された値をsessionに保存
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new # 新規インスタンス作成
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      # password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
    )
    if @user.save
　　　# ログインするための情報を保管
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/registration'
    end
  end

  def session5
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
　# 許可するキーを設定
  def user_params
    params.require(:user).permit(:email, :password, :nickname,:tel, :birthday, :name_kana, :name)
  end
end
