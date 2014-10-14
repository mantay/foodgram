Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :users, only: [:index, :show]

  match '/users/:id/finish_signup' => 'users#finish_signup',  via: [:get, :patch], as: :finish_signup
  match '/users/:id/combine_profiles' => 'users#combine_profiles', via: [:post, :get, :patch], as: :combine_profiles
  match '/users/:id/merge_profiles' => 'users#merge_profiles', via: [:get, :patch], as: :merge_profiles
end
