class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show, :search]
  before_action :set_product,         only: [:show, :edit, :update, :destroy, :buy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
    @ladies_product = Product.index(category:"レディース")
    @mens_product = Product.index(category:"メンズ")
    @e_product =  Product.index(category:"家電・スマホ・カメラ")
    @hobby_product = Product.index(category:"おもちゃ・ホビー・グッズ")
    @chanel_product = Product.index(brand_name:"シャネル")
    @louis_product = Product.index(brand_name:"ルイヴィトン")
    @supreme_product = Product.index(brand_name:"シュプリーム")
    @nike_product = Product.index(brand_name:"ナイキ")
  end

  def buy
    @images = @product.images
    @user = @product.user
  end

  def new
    @product = Product.new
    @product.images.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.images.present? && @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def show
    @images = @product.images
    @comment = Comment.new
  end
  
  def edit
    @images = @product.images
  end

  def buy
    @product = Product.includes(:images).find(params[:product_id])
    @image = Image.find(params[:product_id])
    @user = @product.user
  end

  def confirm
    @card = current_user.card
    @sold = Product.find(params[:product_id])
    @sold.update_attribute('sold', "売り切れました")
    Payjp.api_key = "sk_test_96f14e0e07de7024eedd09ec"
    Payjp::Charge.create(
      amount:  @sold.price , # 決済する値段
      customer: @card.customer_id, # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

  def update
    @images = @product.images
    if @product.images.present? && @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end
  
  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render user_path(@product.user_id)
    end
  end

  def search
    @products = Product.search(params[:product][:keyword]) 
  end

  private
  def access_registration 
    redirect_to new_user_session_path unless user_signed_in?
  end

  def ensure_correct_user
    if @product.user_id != current_user.id
      redirect_to root_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :content, :status, :s_prefecture, :s_charge, :s_method, :s_date, :price, :category, :brand_name, :sold, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
