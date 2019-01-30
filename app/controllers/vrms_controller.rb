class VrmsController < ApplicationController
  def upload
    user_id = current_user.id
    if Vrm.exists?(owner_id: user_id)
      Vrm.find_by(owner_id: user_id).destroy
    end
    @vrm = Vrm.new(name: params[:name], data: params[:data].read, owner_id: user_id)
    if @vrm.save
      render json: @vrm.name, status: 200
    else
      render json: { errors: @vrm.errors.full_messages }, status: 400
    end
  end

  def download
    @vrm = Vrm.find_by(owner_id: current_user.id)
    if @vrm
      send_data @vrm.data
    else
      # render json: { errors: @vrm.errors.full_messages }, status: 400
      send_data File.read('./public/default.vrm')
    end
  end
end
