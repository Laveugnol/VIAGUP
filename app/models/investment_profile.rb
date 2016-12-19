class InvestmentProfile < ApplicationRecord
  belongs_to :user

  # validates :prenom, presence: true
  # validates :nom, presence: true
  # validates :civilite, inclusion: { in: ["Monsieur", "Madame"], allow_nil: false }
  # validates :categoriesp, inclusion: { in: ["Agrculteur", "Artisan", "Chef d'entreprise", "Cadre", "Professeur", "Profession libérale", "Profession scientfique ou artistique", "Profession intermédiare", "Employé", "Ouvrier", "Retraité", "Sans activité professionnelle"], allow_nil: false }
  # validates :expertise, inclusion: { in: ["Architecture", "Autre", "BTP et second oeuvre", "Commerciale", "Comptabilité & finance", "Edition/Ecriture", "Formation/Education", "Gestion de projet", "Hotellerie", "Informatique", "Ingénierie", "Maintenance & réparation", "Immobilier", "Juridique", "Logistique", "Marketing", "Production", "Qualité", "Recherche", "Ressources humaines", "Santé", "Sécurité", "Services administratifs", "Service clientèle", "Stratégie & management"], allow_nil: false }
  # validates :adresse, presence: true
  # validates :code_postal, presence: true
  # validates :country, presence: true

  # validates :mobile, presence: true
  # validates :ville, presence: true
  # validates :nationalite, presence: true
  # validates :birth_place, presence: true
  # validates :birth_date, presence: true

  mount_uploader :idcard, IdcardUploader
  mount_uploader :justificatif, JustificatifUploader



end
