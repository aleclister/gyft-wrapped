Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # resources :hobbies
  root            to: 'pages#home'
  get 'about',    to: 'pages#about' ,     as: :about
  get 'contact',  to: 'pages#contact',    as: :contact
  get 'dashboard', to: 'pages#dashboard',     as: :dashboard
  get  'relationprofile', to:  'pages#relationprofile', as: :relationprofile
  get 'addRelation', to: 'relations#add',    as: :addRelation
  post 'relations', to:'relations#create', as: :relations
  get 'product', to: 'products#show', as: :productshow
  # get 'tags/:tag', to: 'relations#index', as: :tag
  resources :users
#  get 'relations' to: 'relations#index'
#
authenticate :user, ->(user) { user.admin? } do
  mount Blazer::Engine, at: "blazer"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
