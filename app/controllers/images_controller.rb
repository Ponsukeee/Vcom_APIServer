class ImagesController < ApplicationController
  def upload
    @image = Image.new(image: params[:image], owner_id: current_user.id)
    if @image.save
      render json: @image, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def download
    @image = Image.find_by(owner_id: current_user.id)
    if @image
      # send_data(@image.image, :disposition => "inline", :type => "image/jpg")
      # render json: @image
      send_data File.read('./public/' + @image.image.url)
    else
      render json: { errors: @image.errors.full_messages }, status: 400
    end
  end
end
