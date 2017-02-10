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
  get "pages/signature_viager_2"
  post "pages/signature_viager_2"
  patch "pages/assign_acquisition"
  get "signatures/embedded_subscription"
  get "pages/statuts_sci2"
  post "pages/assign_statuts"
  get "pages/pacte_associes2"
  post "pages/assign_pacte"
  get "pages/acte_propriete2"
  post "pages/assign_acte"
  get "pages/compte_courant2"
  patch "pages/assign_compte"
  get "pages/validation_profil"
  post "pages/validate_profil"
  get "pages/contact"
  post "contacts/create"
  get "pages/FAQ"
  get "pages/blog"






  post '/signatures/callbacks',
    to: 'signatures#callbacks'
   resources :signatures, only: [:new, :create]



  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :olds
  resources :viagers
  resources :investment_profiles
  resources :faqs
  root to: 'pages#home'


end
