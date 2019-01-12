class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :create, :signin ]
  
  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name])

    if @user.save
      render json: { name: @user.name, token: @user.token }
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def signin
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: { name: @user.name, token: @user.token }
    else
      render json: { errors: ['ログインに失敗しました'] }, status: 401
    end
  end

  def me
    @user = current_user
    render json: { name: @user.name, token: @user.token }
  end
end
