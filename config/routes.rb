Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # resources :hobbies
  root            to: 'pages#home'
  get 'about',    to: 'pages#about' ,     as: :about
  get 'contact',  to: 'pages#contact',    as: :contact
  get 'dashboard', to: 'users#dashboard',     as: :dashboard
  get  'relation', to:  'relations#show', as: :relation
  get 'addRelation', to: 'relations#add',    as: :addRelation
  post 'relations', to:'relations#create', as: :relations
  get 'all-relations', to: 'relations#index', as: :allrelations
  get 'product', to: 'products#show', as: :productshow
  get 'all-products', to: 'products#index', as: :productindex
  post  'products/_data_stats', to: 'products#index', as: :product_data_stats
  # get 'tags/:tag', to: 'relations#index', as: :tag
  resources :users
#  get 'relations' to: 'relations#index'
#
authenticate :user, ->(user) { user.admin? } do
  mount Blazer::Engine, at: "blazer"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
