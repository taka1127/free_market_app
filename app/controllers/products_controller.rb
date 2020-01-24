class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @products = Product.includes(:images).order('created_at DESC')
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
    @images = Image.where(product_id: params[:id])
    # @category = @product.category(あとで使います)
    # @brand = @product.brand
    @comment = Comment.new
  end
  
  def edit
    @images = @product.images
  end

  def buy
    @product = Product.find(params[:product_id])
    # @category = @product.category(あとで使います)
    @image = Image.find(params[:product_id])
    @brand = @product.brand
    @user = @product.user
  end

  def update
    @images = @product.images
    if @product.update(product_params)
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
    params.require(:product).permit(:name, :content, :status, :s_prefecture, :s_charge, :s_method, :s_date, :price, :category, :brand_name, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
