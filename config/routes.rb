Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # resources :hobbies
  root            to: 'pages#home'
  get 'about',    to: 'pages#about' ,     as: :about
  get 'contact',  to: 'pages#contact',    as: :contact
  get 'dashboard', to: 'users#dashboard',     as: :dashboard

  resources :relations

  # get 'addRelation', to: 'relations#add', as: :addRelation
  # post 'relations', to:'relations#create', as: :relations
  # get 'relations', to: 'relations#index', as: :allrelations
  # get  'relation/:id', to:  'relations#show', as: :relation
  # get 'relation/:id/edit', to: 'relations#edit', as: :edit_relation
  # patch 'relation/:id', to: 'relations#update'
  # delete 'relation/:id', to: 'relations#destroy'

  
  get 'products', to: 'products#index', as: :productindex
  get 'product/:id', to: 'products#show', as: :product
  post  'products/_data_stats', to: 'products#index', as: :product_data_stats

  resources :users

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
