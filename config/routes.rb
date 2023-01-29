Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations' }

  root 'homes#index', as: 'home'

  resources :pizzas, only: %I[show index]
end
