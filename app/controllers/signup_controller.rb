class SignupController < ApplicationController
  # before_action :set_address

  def user_top
  end

  def session1
    @user = User.new 
  end

  def session2
    # session1で入力された値をsessionに保存
    # binding.pry
    session[:nickname] = user_params[:nickname]

    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:birthday] = user_params[:birthday]
    @user = User.new 
    @adresses = Address.new 
    # @user.build_address
  end

  def session3
    # session2で入力された値をsessionに保存
    # binding.pry
    session[:tel] = user_params[:tel]
    @user = User.new 
    # binding.pry
    # @user.build_address
    # @adresses = Address.new 
    # @address = Address.new(address_params)
  end

  def session4
    # binding.pry
    # session3で入力された値をsessionに保存
    session[:name] = user_params[:name]
    session[:name_kana] = user_params[:name_kana]
    @user = User.new 
    # @user.build_address

    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:house_number] = user_params[:house_number]
    session[:building] = user_params[:building]
    # binding.pry
    # @user.addresses.build
    @address = Address.new
    # @address = Address.new(address_params)
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
    # @user.build_address(user_params[:address_attributes])

    @address = Address.new(
      postal_code: session[:postal_code], 
      prefecture: session[:prefecture], 
      city: session[:city], 
      house_number: session[:house_number], 
      building: session[:building], 
      # tel: session[:tel]addressカラムに作っていないのでコメントアウト
      # session4のデータ(クレジットカード情報)未実装
    )
    # binding.pry
    if @user.save
    # if @user.save && @address.save!
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
    # params.require(:user).permit(:email, :password, :nickname, :tel, :birthday, :name_kana, :name,address_attributes: [ :postal_code,:prefecture,:city,:house_number,:building])
    # params.require(:user).permit(:email, :password, :nickname, :tel, :birthday, :name_kana, :name,address_attributes: [ :postal_code,:prefecture,:city,:house_number,:building]).merge(address_id: current_address.id)
    params.require(:user).permit(:email, :password, :nickname, :tel, :birthday, :name_kana, :name,addresses_attributes: [ :id, :postal_code,:prefecture,:city,:house_number,:building])
  end

  # def address_params
  #   params.require(:address).permit(:postal_code,:prefecture,:city,:house_number,:building )
  # end

  # def set_address
  #   @address = Address.find(params[:address_id])
  # end
  
end

# class SignupController < ApplicationController

#   def user_top
#   end

#   def session1
#     @user = User.new 
#   end

#   def session2
#     # session1で入力された値をsessionに保存
#     session[:nickname] = user_params[:nickname]
#     session[:email] = user_params[:email]
#     session[:password] = user_params[:password]
#     session[:birthday] = user_params[:birthday]
#     @user = User.new 
#     # @user.build_address
#   end

#   def session3
#     # session2で入力された値をsessionに保存
#     session[:tel] = user_params[:tel]
#     @user = User.new 
#     @user.build_address
#   end

#   def session4
#     # session3で入力された値をsessionに保存
#     session[:name] = user_params[:name]
#     session[:name_kana] = user_params[:name_kana]
#     @user = User.new 
#   end

#   def create
#     @user = User.new(
#       # session1のデータ
#       nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
#       email: session[:email],
#       password: session[:password],
#       birthday: session[:birthday], 
#       # session2のデータ
#       tel: session[:tel], 
#       # session3のデータ
#       name: session[:name], 
#       name_kana: session[:name_kana], 
#     )
#     @user.build_address(user_params[:addresses_attributes])
#       # tel: session[:tel]addressカラムに作っていないのでコメントアウト
#       # session4のデータ(クレジットカード情報)未実装
#     # binding.pry
#     if @user.save
#       # ログインするための情報を保管
#       session[:id] = @user.id
#       redirect_to session5_signup_index_path
#     else
#       redirect_to root_path
#       # render '/signup/registration'
#     end
#   end

#   def session5
#     sign_in User.find(session[:id]) unless user_signed_in?
#   end

#   private
#   # 許可するキーを設定
#   def user_params
#     params.require(:user).permit(:email, :password, :nickname, :tel, :birthday, :name_kana, :name,addresses_attributes: [ :id, :postal_code,:prefecture,:city,:house_number,:building])
#   end
# end
