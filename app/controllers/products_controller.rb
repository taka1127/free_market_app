class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]

  def index
    # @images = Image.all
    # @category = @product.category(あとで使います)
    @ladies_product = Product.includes(:images).where(category_L:"レディース").order("created_at DESC").limit(10)
    @mens_product = Product.includes(:images).where(category_L:"メンズ").order("created_at DESC").limit(10)
    @e_product = Product.includes(:images).where(category_L:"家電・スマホ・カメラ").order("created_at DESC").limit(10)
    @hobby_product = Product.includes(:images).where(category_L:"おもちゃ・ホビー・グッズ").order("created_at DESC").limit(10)
    @chanel_product = Product.includes(:images).where(brand_id:18).order("created_at DESC").limit(10)
    @louis_product = Product.includes(:images).where(brand_id:2).order("created_at DESC").limit(10)
    @supreme_product = Product.includes(:images).where(brand_id:17).order("created_at DESC").limit(10)
    @nike_product = Product.includes(:images).where(brand_id:10).order("created_at DESC").limit(10)
    @products = Product.all.includes(:images).limit(10).order("created_at DESC")
    # @images = @products.images
  end

  def new
    @product = Product.new
    @product.images.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end


  private
  def access_registration 
    redirect_to new_user_session_path unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:name, :content, :status, :s_prefecture, :s_charge, :s_method, :s_date, :price,:category_L, :category_M, :category_S, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
