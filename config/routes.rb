Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
 
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'

  resources :users

  resources :agencies
  resources :jobs

  resources :agencies, only: [:index] do 
	  resources :jobs, only: [:index]
  end
end
