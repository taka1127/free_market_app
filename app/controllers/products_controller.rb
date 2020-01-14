class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to '/'
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  # def show
  # end

  private
  def product_params
    params.require(:product).permit(:name, :content, :status, :delivery_charge, :shipping_method, :date_of_shipment, :price)
  end
end
