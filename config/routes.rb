Rails.application.routes.draw do


  get 'signatures/callbacks'

  get "pages/profil"
  get "pages/invest_step1"
  get "pages/invest_step2"
  get "pages/invest_step3"
  get "pages/invest_step4"
  post "pages/finalize"
  patch "investment_profiles/update_step3"
  get "signatures/embedded_signature"

  post '/signatures/callbacks',
    to: 'signatures#callbacks'
   resources :signatures, only: [:new, :create]



  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :viagers
  resources :investment_profiles
  root to: 'pages#home'


end
