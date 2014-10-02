Rails.application.routes.draw do
  root 'static_pages#home'

  get 'users/index'

  devise_for :users
  resources :users, only: [:index, :show]       
  # devise_scope :user do
  #   get 'signup',      to: 'devise/registrations#new'
  #   get 'signin',      to: 'devise/sessions#new'
  # end


end
