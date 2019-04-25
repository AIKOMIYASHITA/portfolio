Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#delete'

  get 'comments/index'
  get '/comments', to:'comments#new'
  post '/comments', to:'comments#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "/users/search" => "users#search" ,as: "search"
  resources :users do
    resources :user_comments
  end

  resources :topics
  resources :comments
end
