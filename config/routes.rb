Rails.application.routes.draw do
  resources :emergencies, except: [:show, :update]
  get '/emergencies/:code' => 'emergencies#show'
  patch '/emergencies/:code' => 'emergencies#update'
  resources :responders, except: [:show, :update]
  get '/responders/:name' => 'responders#show'
  patch '/responders/:name' => 'responders#update'
end
