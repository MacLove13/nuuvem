Rails.application.routes.draw do
  get 'dashboard', to: "dashboard#index"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_admin_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_admin_session
  end

  namespace :upload do
    get :new
    post :create
  end

  namespace :report do
    get '/show/:id', action: :show
  end

  get 'home/index'

  root "home#index"
end
