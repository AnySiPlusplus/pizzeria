Rails.application.routes.draw do
  root 'homes#index', as: 'home'

  resources :pizzas, only: %I[show index]
end
