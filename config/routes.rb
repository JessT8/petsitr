Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/index' => 'sitters#index', as: 'main'
  get '/sitters/:id' => 'sitters#show', as: 'sitter'
  get '/profile' => 'sitters#profile', as: 'profile'
  get '/profile/new' => 'sitters#new', as: 'new_profile'
  post '/profile' => 'sitters#create'
  
  get '/profile/edit' => 'sitters#edit', as: 'edit_profile'

end
