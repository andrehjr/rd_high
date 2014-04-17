Rails.application.routes.draw do
  post '/people', to: 'people#create'
  root to: 'people#new'
end
