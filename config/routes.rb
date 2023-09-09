Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "splashs#index"
  
  resources :patients, only: [:index, :show, :create, :new, :update, :destroy] do
    resource :appointments, only: [:index, :new, :create, :show, :destroy]
  end

  get '/appointments', to: 'appointments#index'
end
