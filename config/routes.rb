Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json}  do
      namespace :items do
        get 'find',     to: "find#show"
        get 'find_all', to: "find#index"
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
    end
  end

  namespace :api do
    namespace :v1 do
      resources :merchants,      only: [:show, :index], defaults: {format: :json}
      resources :items,          only: [:show, :index], defaults: {format: :json}
      resources :invoice_items,  only: [:show, :index], defaults: {format: :json}
      resources :invoices,       only: [:show, :index], defaults: {format: :json}
      resources :customers, only: [:show, :index], defaults: {format: :json}
    end
  end
end
