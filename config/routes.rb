Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  root 'home#index'
  devise_for :users
  namespace :admin do
    resources :blogs, except: [:show]
    resources :orders, only: [:show, :index, :destroy]
  end
  resources :about, only: [:index]
  resources :blogs, path: 'blog', only: [:index, :show]
  resources :contact, only: [:index]
  resources :faq, only: [:index]
  resources :orders, only: [:new, :create, :show]
  resources :services, only: [:index, :show]
  resources :terms_and_conditions, path: 'terms-and-conditions', only: [:index]
  resources :users, path: 'my-account', only: [:update] do
    get '/', to: :show, on: :collection
  end
end
