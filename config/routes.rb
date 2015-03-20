Rails.application.routes.draw do
devise_for :users

 root 'users#welcome'

  resources :requests

  resources :users

  resources :passes

  resources :events

  resources :clubs

end
