Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }

  root 'homes#index', as: 'home'

  resources :pizzas, only: %i[show index] do
    resources :reviews, only: :create
  end

  resource :cart, only: %i[show update]
  resource :order_items
  resource :fillings

  resource :address, only: %i[edit update]
  resource :user_photo, except: :show
  resource :fast_authentificate, only: %i[create show]

  namespace :checkouts do
    resource :delivery, only: %i[show update]
    resource :address, only: %i[show update]
    resource :payment, only: %i[show create update]
    resource :confirm, only: %i[show create]
    resource :complete, only: %i[show]
  end

  resources :orders, only: %i[show index]
end
