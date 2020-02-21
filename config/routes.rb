Rails.application.routes.draw do

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'sitters#index'
    get '/index' => 'sitters#index', as: 'main'
    get '/sitters/:id' => 'sitters#show', as: 'sitter'
    get '/profile' => 'sitters#profile', as: 'profile'
    get '/profile/new' => 'sitters#new', as: 'new_profile'
    post '/profile' => 'sitters#create'

    get '/profile/edit' => 'sitters#edit', as: 'edit_profile'
    patch '/sitters/:id' => 'sitters#update'
    get '/profile/edit/timeslots/:id' => 'timeslots#edit', as: 'edit_timeslot'
    patch '/profile/edit/timeslots/:id' => 'timeslots#update'

    #testing bookings
    get '/sitters/:id/bookings/new' => 'bookings#new', as: 'new_booking' #testing
    get '/users/bookings' => 'bookings#show', as: 'bookings'
    post '/sitters/:id/bookings' => 'bookings#create', as: 'create_booking'
    patch '/users/bookings' => 'bookings#update', as: 'update_booking'

    #testing timeslots
    get '/timeslots/new' => 'timeslots#new', as: 'new_timeslot' #for testing
    post '/timeslots' => 'timeslots#create' #for testing
end
