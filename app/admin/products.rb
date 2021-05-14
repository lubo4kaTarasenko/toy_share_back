ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :kind, :category_id, :subcategory_id, :user_id, :status, :url_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :kind, :category_id, :subcategory_id, :user_id, :status, :url_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
