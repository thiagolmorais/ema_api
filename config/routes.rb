Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :customers, only:[:index, :show, :create, :update] do
      resources :prices, only:[:index, :create, :destroy]
      get 'current_price', { controller: 'customers', action: 'current_price' }
      get 'appointments', { controller: 'customers', action: 'appointment' }
    end
    resources :appointments, only:[:index, :show, :create, :update, :destroy]
    get 'setting', { controller: 'configuration', action: 'setting' }
    put 'setting', { controller: 'configuration', action: 'modify' }
  end
end
