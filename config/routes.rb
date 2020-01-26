Rails.application.routes.draw do
  resources :games
  resources :projects
  resources :sessions, only: [:create, :new, :destroy]

  post '/add_image' => 'projects#add_image'
  get '/delete_image' => 'projects#delete_image'
  
  post '/add_main_image' => 'projects#add_main_image'
  get '/delete_main_image' => 'projects#delete_main_image'

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
