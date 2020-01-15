class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]

  def index
  end
  
  def show
    @product = Product.find("id: params")
    @image = Image.find("id: params")
    @category = Category.find("id: params")
    @brand = Brand.select("brand")
  end
  
  def edit
  end
  

private

    def access_registration
      redirect_to new_user_session_path, unless user_signed_in?　
      end
    end
end
