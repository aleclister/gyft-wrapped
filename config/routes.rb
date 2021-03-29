Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root            to: 'pages#home'
  get 'about',    to: 'pages#about' ,     as: :about
  get 'contact',  to: 'pages#contact',    as: :contact
#  get 'relations' to: 'relations#index'
#
authenticate :user, ->(user) { user.admin? } do
  mount Blazer::Engine, at: "blazer"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
