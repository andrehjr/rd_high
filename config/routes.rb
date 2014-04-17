Rails.application.routes.draw do
  resources :users

  post '/people', to: 'people#create'
  root to: 'people#index'
end
