class SimpleImagesController < ApplicationController
  def upload
    @image = SimpleImage.new(name: params[:name], data: params[:data].read, owner_id: current_user.id)
    if @image.save
      render json: @image.name, status: 200
    else
      render json: { errors: @image.errors.full_messages }, status: 400
    end
  end

  def download
    @image = SimpleImage.find_by(owner_id: current_user.id)
    if @image
      # send_data(@image.image, :disposition => "inline", :type => "image/jpg")
      # render json: @image
      send_data @image.data, disposition: 'inline', type: 'image/png'
    else
      render json: { errors: @image.errors.full_messages }, status: 400
    end
  end
end
