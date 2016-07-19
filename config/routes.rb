Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show, :index], defaults: {format: :json}
      resources :items,     only: [:show, :index], defaults: {format: :json}
    end
  end
end
