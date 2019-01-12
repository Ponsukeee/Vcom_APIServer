Rails.application.routes.draw do
  resources :users, only: [ :create ] do
    collection do
      post 'signin'
      get 'me'
    end
  end
end
