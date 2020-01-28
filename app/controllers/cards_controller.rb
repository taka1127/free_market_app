class CardsController < ApplicationController
  require 'payjp'
  # before_action :set_card

  # 後ほど登録したクレジットの表示画面を作成します。
  def index
  end

  # クレジットカード情報入力画面
  def new
    @card = Card.new
  end

  # 登録画面で入力した情報をDBに保存
  def create
    Payjp.api_key = "sk_test_96f14e0e07de7024eedd09ec"
    if params['payjp-token'].blank?
      render 'mypage/index'
    else
      customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
        card: params['payjp-token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer[:id])
      if @card.save
        redirect_to root_path
      else
        render 'mypage/index'
      end
    end
  end

  # private

  # def set_card
  #   @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  # end

  # def card_params
  #   params.require(:card).permit(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  # end
end
