Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'application#home'
 
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  #Omniauth
  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :users

  resources :agencies
  resources :jobs


  resources :agencies, only: [:index, :new, :show] do 
	  resources :jobs, only: [:index, :new, :show]
  end

  resources :users do 
    resources :jobs, only: [:index, :show]
  end
end
