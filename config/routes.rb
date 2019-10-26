Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  namespace :instructor do
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create] do
        resources :lessons, only: [:new, :create]
      end
    end
  end
end 