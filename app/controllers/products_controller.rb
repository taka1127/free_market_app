class ProductsController < ApplicationController
  before_action :access_registration, except: [:index, :show]

  def index
    @images = Image.all
    # @category = @product.category(あとで使います)
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
    params.require(:product).permit(:name, :content, :status, :s_prefecture, :s_charge, :s_method, :s_date, :price,:category_L, :category_M, :category_S, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
