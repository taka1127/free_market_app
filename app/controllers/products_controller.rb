class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]

  def index
  end

  def show
  end

private

  def access_registration
    # リダイレクト先をトップページに仮置き
    redirect_to "#" unless user_signed_in?　
  end

end
