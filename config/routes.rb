Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:show], defaults: {format: :json}
      resources :items,     only: [:show], defaults: {format: :json}
    end
  end
end
