Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :items do
        get 'find',     to: "find#show",  defaults: {format: :json}
        get 'find_all', to: "find#index", defaults: {format: :json}
      end
    end
  end

  namespace :api do
    namespace :v1 do
<<<<<<< HEAD
      resources :merchants,      only: [:show, :index], defaults: {format: :json}
      resources :items,          only: [:show, :index], defaults: {format: :json}
      resources :invoice_items,  only: [:show, :index], defaults: {format: :json}
=======
      namespace :merchants do
        get '/find',     to: 'find#show', defaults: {format: :json}
        get '/find_all', to: 'find#index', defaults: {format: :json}
      end
      namespace :customers do
        get '/find',     to: 'find#show', defaults: {format: :json}
        get '/find_all', to: 'find#index', defaults: {format: :json}
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show, :index], defaults: {format: :json}
      resources :customers, only: [:show, :index], defaults: {format: :json}
      resources :items,     only: [:show, :index], defaults: {format: :json}
>>>>>>> d0a4040762c00b09c4a9f4a593b54d5d85f4aef4
    end
  end
end
