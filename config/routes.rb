Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  namespace :admin do
    resources :orders, only: [:show, :index, :destroy]
  end
  resources :about, only: [:index]
  resources :contact, only: [:index]
  resources :faq, only: [:index]
  resources :home, only: [:index]
  resources :landing_pages, only: [:show]
  resources :orders, only: [:new, :create, :show]
  resources :services, only: [:index, :show]
  resources :terms_and_conditions, path: 'terms-and-conditions', only: [:index]
  resources :users, path: 'my-account', only: [:update] do
    get '/', to: :show, on: :collection
  end
end
