class SignupController < ApplicationController

  def user_top
  end

  def session1
    @user = User.new 
    # @user.addresses.new
  end

  def session2
    # session1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:birthday] = user_params[:birthday]
    @user = User.new 
  end

  def session3
    # session2で入力された値をsessionに保存
    session[:tel] = user_params[:tel]
    @user = User.new 
    @address = Address.new
  end

  def session4
    # session3で入力された値をsessionに保存
    session[:name] = user_params[:name]
    session[:name_kana] = user_params[:name_kana]
    @user = User.new 
    session[:postal_code] = address_params[:postal_code]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building] = address_params[:building]
    @address = Address.new
  end

  def create
    @user = User.new(
      # session1のデータ
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      birthday: session[:birthday], 
      # session2のデータ
      tel: session[:tel], 
      # session3のデータ
      name: session[:name], 
      name_kana: session[:name_kana], 
    )
    @address = Address.new(
      postal_code: session[:postal_code], 
      prefecture: session[:prefecture], 
      city: session[:city], 
      house_number: session[:house_number], 
      building: session[:building], 
      # user_id: current_user.id
      # tel: session[:tel]addressカラムに作っていないのでコメントアウト
      # session4のデータ(クレジットカード情報)未実装
    )
    if @user.save && @address.save
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to session5_signup_index_path
    else
      redirect_to root_path
      # render '/signup/registration'
    end
  end

  def session5
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  # 許可するキーを設定
  def user_params
    params.require(:user).permit(:email, :password, :nickname, :tel, :birthday, :name_kana, :name)
  end

  def address_params
    params.require(:user).require(:addresses).permit(:postal_code,:prefecture,:city,:house_number,:building )
    # params.require(:user).require(:addresses).permit(:postal_code,:prefecture,:city,:house_number,:building ).merge(user_id: current_user.id)
  end

end