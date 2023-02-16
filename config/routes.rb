Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }

  root 'homes#index', as: 'home'

  resources :pizzas, only: %I[show index] do
    resources :reviews, only: :create
  end

  resource :address, only: %i[edit update]
  resource :user_photo, only: %i[edit update destroy create]
end
