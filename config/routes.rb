Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/timeslots/new' => 'timeslots#new', as: 'new_timeslot'

    post '/timeslots' => 'timeslots#create'

end
