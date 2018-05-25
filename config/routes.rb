Rails.application.routes.draw do
  resources :channels
  resources :notes
  resources :users
  post '/login', to: 'authentication#authenticate'
  post '/register', to: 'authentication#register'
  get '/user/:id/notes', to: 'users#userNotes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
