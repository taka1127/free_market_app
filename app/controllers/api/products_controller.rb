# class Api::ProductsController < ApplicationController

#   require 'payjp'
#   Payjp.api_key = Rails.application.secrets.dig(:payjp, :PAYJP_SECRET_KEY: sk_test_96f14e0e07de7024eedd09ec)

#   def index
#   end
 
#   def pay
#      Payjp.api_key = 'sk_test_96f14e0e07de7024eedd09ec'
#      Payjp::Charge.create(
#        amount: 3500, 
#        card: params['payjp-token'],
#        currency: 'jpy'
#      )
#    end
 
#    def self.create_card_to_payjp(params)
#      # トークンを作成 
#      token = Payjp::Token.create({
#        card: {
#          number:     params['number'],
#          cvc:        params['cvc'],
#          exp_month:  params['valid_month'],
#          exp_year:   params['valid_year']
#        }},
#        {'X-Payjp-Direct-Token-Generate': 'true'} 
#      )
#      # 上記で作成したトークンをもとに顧客情報を作成
#      Payjp::Customer.create(card: token.id)
#    end














end