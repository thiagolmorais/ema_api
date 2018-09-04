Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :customers, only:[:index, :show, :create, :update] do
      resources :prices, only:[:index, :create, :destroy]
      get "appointments", { controller: 'customers', action: 'appointment' }
    end
    resources :appointments, only:[:index, :create, :update, :destroy]
  end
end
