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
  post "signatures/reservation"
  get "pages/admin"
  get "pages/old"
  post "pages/attribution"
  get "pages/epargne"
  get "pages/creation_viager"
  get "pages/signature_viager_1"
  get "pages/signature_viager_2"
  post "pages/signature_viager_2"
  patch "pages/assign_acquisition"
  get "signatures/embedded_subscription"



  post '/signatures/callbacks',
    to: 'signatures#callbacks'
   resources :signatures, only: [:new, :create]



  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :olds
  resources :viagers
  resources :investment_profiles
  root to: 'pages#home'


end
