class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]

  def index
    @ladies_product = Product.index(category_L:"レディース")
    @mens_product = Product.index(category_L:"メンズ")
    @e_product =  Product.index(category_L:"家電・スマホ・カメラ")
    @hobby_product = Product.index(category_L:"おもちゃ・ホビー・グッズ")
    @chanel_product = Product.index(brand_id:18)
    @louis_product = Product.index(brand_id:2)
    @supreme_product = Product.index(brand_id:17)
    @nike_product = Product.index(brand_id:10)
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
    @product = Product.find(params[:id])
    @images = Image.where(product_id: params[:id])
    @comment = Comment.new
  end
  
  def edit
  end

  def update
  end
  
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render user_path(@product.user_id)
    end
  end




  private
  def access_registration 
    redirect_to new_user_session_path unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:name, :content, :status, :s_prefecture, :s_charge, :s_method, :s_date, :price,:category_L, :category_M, :category_S, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end


end
