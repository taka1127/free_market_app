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

# インスタンス変数前（今後、記述は消す予定）
# @productname = Product.select("name")
# @productimage = Image.select("image")
# @username = 
# @categoyl = Category.select("category_L")
# @categorym = Category.select("category_M")
# @categorys = Category.select("category_S")
# @brand = Brand.select("brand")
# @status = Product.select("status")
# @deliverycharge = Product.select("delivery_charge")
# @shippingmethod = Product.select("shipping_method")
# @prefecture = Product.select("prefecture")
# @shipmentdate = Product.select("date_of_shipment")
# @productprice = Product.select("price")
# @productcontent = Product.select("content")