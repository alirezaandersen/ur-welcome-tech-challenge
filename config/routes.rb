Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :messages, only: [:index]
    end
  end
end
