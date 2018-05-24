Rails.application.routes.draw do
  resources :channels
  resources :notes
  resources :users
  post 'login', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
