Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  
  resources :users, only: [:new, :create, :show]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :stories
  resources :worlds
  resources :worlds, only: [:show] do
    resources :characters, except: [:new, :create, :edit, :update]
  end

  resources :characters, only: [:new, :create, :edit, :update]
end
