Rails.application.routes.draw do


  get "pages/profil"
  get "pages/invest_step1"
  get "pages/invest_step2"
  get "pages/invest_step3"


  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :viagers
  resources :investment_profiles
  root to: 'pages#home'


end
