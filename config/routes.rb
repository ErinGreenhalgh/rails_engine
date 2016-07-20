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
        get '/find',     to: "find#show"
        get '/find_all', to: "find#index"
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
    namespace :v1, defaults: {format: :json} do
      resources :invoices, only: [:show] do
        get '/transactions',  to: "invoices#transactions"
        get '/invoice_items', to: "invoices#invoice_items"
        get '/items',         to: "invoices#items"
        get '/customer',      to: "invoices#customer"
        get '/merchant',      to: "invoices#merchant"
      end
<<<<<<< HEAD
      resources :merchants, only: [:show], defaults: {format: :json} do
        get '/items',            to: "merchants#items"
        get '/invoices',         to: "merchants#invoices"
      end
    end
  end

=======
      resources :items, only: [:show] do
        get '/invoice_items', to: "items#invoice_items"
        get '/merchant', to: "items#merchant"
      end
    end
  end
>>>>>>> ad421f7b8c15a4f4788ae529c00e6e78d6f2fe47
end
