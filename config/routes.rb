Rails.application.routes.draw do
  get 'movies/index'
  resources :movies, only: :index

  root to: 'pages#home'
end
