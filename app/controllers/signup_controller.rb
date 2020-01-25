class SignupController < ApplicationController
  require 'payjp' #payjpの読み込み

  def user_top
  end

  def session1
    @user = User.new 
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
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    @user = User.new 
    session[:postal_code] = address_params[:postal_code]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building] = address_params[:building]
    session[:tel] = address_params[:tel]
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
      first_name: session[:first_name], 
      last_name: session[:last_name], 
      first_name_kana: session[:first_name_kana], 
      last_name_kana: session[:last_name_kana], 
    )
      
    @user.save      #@user.saveでセーブしuser.idを取得
      
      # tel: session[:tel]addressカラムに作っていないのでコメントアウト
      # session4のデータ(クレジットカード情報)未実装

      # @user.build_addressで親モデルに属する子モデルを生成し@addressを代入
    @address = @user.build_address(
      postal_code: session[:postal_code], 
      prefecture: session[:prefecture], 
      city: session[:city], 
      house_number: session[:house_number], 
      building: session[:building],
      tel: session[:tel],
      user_id: @user.id
    )

    if @user.save && @address.save
      # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to session5_signup_index_path
    else
      redirect_to root_path
    end
  end

  def session5
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] # APIキーの呼び出し
  if params['payjp_token'].blank? # ここはJavaScriptの.append()内のname属性です
    render '/signup/session4'
  else
    customer = Payjp::Customer.create(        # customerの定義、ここの情報を元に、カード情報との紐付けがされる
      description: 'test',                    # なくてもいいです
      email: current_user.email,              # なくてもいいです
      card: params['payjp_token'],            # 必須です
      metadata: {user_id: current_user.id}    # なくてもいいです
    )
    @card = Card.new(                  # カードテーブルのデータの作成
      user_id: current_user.id,        # ここでcurrent_user.idがいるので、前もってsigninさせておく
      customer_id: customer.id,        # customerは上で定義
      card_id: customer.default_card   # .default_cardを使うことで、customer定義時に紐付けされたカード情報を引っ張ってくる ここがnullなら上のcustomerのcard: params['payjp_token']が読み込めていないことが多い
    )

    if @card.save
      redirect_to done_signup_index_path
    else
      redirect_to action: "create"
    end
  end
end

  private
  # 許可するキーを設定
  def user_params
    params.require(:user).permit(:email, :password, :nickname, :tel, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana)
  end

  def address_params
    params.require(:user).require(:addresses).permit(:postal_code, :prefecture, :city, :house_number, :building, :tel )
  end

end