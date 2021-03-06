ActiveAdmin.register Viager do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :address, :city, :zip_code, :country, :old_id, :photo,
              :rente, :bouquet, :horizon, :tri, :habitable, :piece,
              :niveaux, :ascenceur, :balcon, :annee, :terrain, :annexe, :maison,
              :venale, :decote, :number_share, :salon , :chambre, :exterieur, :acquisition,
              :statuts_sci, :pacte , :compte_courant, :acte_propriete



 index do
    selectable_column
    column :address
    column :id
    column :old_id
    column :city
    column :created_at
    column :rente
    column :bouquet
    column :horizon
    column :tri
    actions
  end

end
