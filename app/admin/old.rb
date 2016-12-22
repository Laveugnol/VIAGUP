ActiveAdmin.register Old do

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

permit_params :age, :lifespan, :first_name, :last_name, :descriptif, :sexe, :projet


 index do
    selectable_column

    column :id
    column :age
    column :lifespan
    column :first_name
    column :last_name
    column :viager_id
    actions
  end

end
