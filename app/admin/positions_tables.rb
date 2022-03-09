ActiveAdmin.register PositionsTable do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :position, :points, :points_system_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:position, :points, :points_system_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
