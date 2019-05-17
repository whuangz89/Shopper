class ShopperController < ApplicationController
  def home
  end

  def about
  end

  def join
    usr = current_user
    usr.role = "owner"
    usr.save
    redirect_to new_product_path, notice: "Welcome to Shopper"
  end
end
