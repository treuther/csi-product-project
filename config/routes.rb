Rails.application.routes.draw do
  
  resources :epas
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new' #existing user needs a session
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' #a new user needs to be created before it has a session
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy' #NOT get because anyone can "request" that URL

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  # match '*path' => redirect('/'), via: :get # reroutes all unknown routes to root url


  resources :reviews
  resources :products do
    resources :reviews, only: [:new, :index] #this is creating the path /products/1/reviews/new or index
  end
  resources :chem_groups
  resources :users #this gives us the user#create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
