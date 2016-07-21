Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json}  do
      namespace :invoices do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
        get '/random',  to: "find#random"
      end
      namespace :merchants do
        get '/find',     to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/revenue',  to: 'find#revenue_for_date_all_merchants'
        get '/most_revenue', to: "find#merchants_most_revenue"
        get '/most_items', to: "find#most_items"
        get '/random',     to: "find#random"
      end
      namespace :customers do
        get '/find',     to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random',   to: "find#random"
      end
      namespace :invoice_items do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
        get '/random',  to: "find#random"
      end
      namespace :items do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
        get '/random',  to: "find#random"
      end
      namespace :transactions do
        get '/find',     to: "find#show"
        get '/find_all', to: "find#index"
        get '/random',   to: "find#random"
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
      resources :merchants, only: [:show], defaults: {format: :json} do
        get '/items',             to: "merchants#items"
        get '/invoices',          to: "merchants#invoices"
        get '/favorite_customer', to: "merchants#fav_customer"
        get '/revenue',           to: "merchants#revenue"
        get '/customers_with_pending_invoices', to: "merchants#pending_customers"
      end
      resources :items, only: [:show] do
        get '/invoice_items', to: "items#invoice_items"
        get '/merchant',      to: "items#merchant"
      end
      resources :customers, only: [:show] do
        get '/invoices',          to: "customers#invoices"
        get '/transactions',      to: "customers#transactions"
        get '/favorite_merchant', to: "customers#favorite_merchant"
      end
      resources :invoice_items, only: [:show] do
        get '/invoice', to: "invoice_items#invoice"
        get '/item',    to: "invoice_items#item"
      end
      resources :transactions, only: [:show] do
        get '/invoice', to: "transactions#invoice"
      end
    end
  end
end
