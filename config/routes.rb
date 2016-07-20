Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json}  do
      namespace :items do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
      end
      namespace :invoices do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
      end
      namespace :merchants do
        get '/find',     to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      namespace :customers do
        get '/find',     to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      namespace :invoice_items do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
      end
      namespace :items do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
      end
      namespace :transactions do
        get '/find',     to: "find#show", defaults: {format: :json}
        get '/find_all', to: "find#index", defaults: {format: :json}
      end
    end
  end

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :merchants,      only: [:show, :index]
      resources :items,          only: [:show, :index]
      resources :invoice_items,  only: [:show, :index]
      resources :invoices,       only: [:show, :index]
      resources :customers,      only: [:show, :index]
      resources :transactions,   only: [:show, :index]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:show] do
        get '/transactions',  to: "invoices#transactions", defaults: {format: :json}
        get '/invoice_items', to: "invoices#invoice_items", defaults: {format: :json}
        get '/items',         to: "invoices#items", defaults: {format: :json}
        get '/customer',      to: "invoices#customer", defaults: {format: :json}
        get '/merchant',      to: "invoices#merchant", defaults: {format: :json}
      end
    end
  end


end
