Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  
  resources :users, only: [:new, :create, :show]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :worlds
  resources :stories
  resources :stories, only: [:show] do
    resources :characters, only: [:new, :index, :show]
  end
  resources :characters
end
