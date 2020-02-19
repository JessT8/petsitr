Rails.application.routes.draw do

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/index' => 'sitters#index', as: 'main'
    get '/sitters/:id' => 'sitters#show', as: 'sitter'

    get '/timeslots/new' => 'timeslots#new', as: 'new_timeslot' #for testing
    post '/timeslots' => 'timeslots#create' #for testing
end
