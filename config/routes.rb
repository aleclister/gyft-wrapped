Rails.application.routes.draw do
  root            to: 'pages#home'
  get 'about',    to: 'pages#about' ,     as: :about
  get 'contact',  to: 'pages#contact',    as: :contact
  get 'relations' to: 'relations#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
