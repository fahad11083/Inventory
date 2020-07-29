Rails.application.routes.draw do
  resources :users
  resources :people
  root 'users#index'
  get '/generate_pdf/:id', to: 'users#download_pdf'
  get '/echo', to: 'users#echo'
  get '/test', to: 'users#test'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
