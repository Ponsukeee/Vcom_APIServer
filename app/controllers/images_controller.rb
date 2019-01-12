class ImagesController < ApplicationController
  def upload
    @image = Image.new(image: params[:image], owner_id: current_user.id)
    if @image.save
      render json: @image, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end
end
