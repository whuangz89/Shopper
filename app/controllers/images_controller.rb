class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    redirect_to root_path
  end


  private
  def image_params
    params.require(:image).permit(:name)
  end
end
