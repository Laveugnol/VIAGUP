Rails.application.routes.draw do



  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :viagers
  root to: 'pages#home'


end
