Rails.application.routes.draw do
  resources :emergencies, except: [:show, :update]
  get '/emergencies/:code' => 'emergencies#show'
  resources :responders, except: [:show, :update]
end
