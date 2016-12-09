Rails.application.routes.draw do



  ActiveAdmin.routes(self)
  devise_for :users

  resources :viagers
  root to: 'pages#home'


end
