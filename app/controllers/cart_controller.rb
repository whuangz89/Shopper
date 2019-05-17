class CartController < ApplicationController
  before_action :authenticate_user!
  def index
    @carts = Cart.all.order("created_at DESC")
  end

  def add

    @cart = current_user.carts.new(cart_params)
    @cart.product_id = params[:id]

    @cart.save
    redirect_to products_path, notice: "product has been succesfully inserted"
  end

  def destroy
    @cart = current_user.carts.delete_all


    redirect_to root_path, notice: "Thank you for coming to Shopster"
  end

  private
  def check_role
     if !current_user.admin?
      redirect_to root_path
    end
  end

  def cart_params
    params.require(:cart).permit(:name, :qty, :size)
  end
end
