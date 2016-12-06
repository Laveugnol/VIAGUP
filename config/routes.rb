Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'

  resources :viagers
end
