class CardsController < ApplicationController
  require 'payjp'

  def index
  end

  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV['payjp_key_secret']
    if params['payjp-token'].blank?
      render 'mypage/index'
    else
      customer = Payjp::Customer.create(
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

end
