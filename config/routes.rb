Rails.application.routes.draw do
  resources :users, only: [ :create ] do
    collection do
      post 'signin'
      get 'me'
    end
  end

  # post 'images' => 'images#upload'
  # get 'images' => 'images#download'

  post 'images' => 'simple_images#upload'
  get 'images' => 'simple_images#download'

  post 'vrms' => 'vrms#upload'
  get 'vrms' => 'vrms#download'
end
