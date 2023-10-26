Rails.application.routes.draw do
  root to: 'tasks#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:create, :update, :destroy, :show]
    end
  end

end
