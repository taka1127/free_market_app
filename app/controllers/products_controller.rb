class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end
  
  def create
    @product = Product.new(product_params)
    binding.pry
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
      # 非ログイン時はログイン画面へ進む
    redirect_to new_user_session_path unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:name, :content, :status, :s_prefecture, :s_charge, :s_method, :s_date, :price,:category_L, :category_M, :category_S, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
