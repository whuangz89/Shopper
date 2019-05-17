class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :check_role, except: [:show, :index]


  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :category, images_attributes: [:id, :name, :_destroy])
  end

  def check_role
     if !current_user.owner?
      redirect_to seller_path, notice: "You haven't registered as seller"
    end
  end
end
