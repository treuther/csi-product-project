Rails.application.routes.draw do
  
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new' #existing user needs a session
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' #a new user needs to be created before it has a session
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy' #NOT get because anyone can "request" that URL

  resources :reviews
  resources :products
  resources :chem_groups
  resources :users #this gives us the user#create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
