class Api::ProductsController < ApplicationController
  def index
  end
 
  def pay
     Payjp.api_key = 'sk_test_96f14e0e07de7024eedd09ec'
     Payjp::Charge.create(
       #amountは値段を記載
       amount: 400000, 
       card: params['payjp-token'],
       currency: 'jpy'
     )
   end

end