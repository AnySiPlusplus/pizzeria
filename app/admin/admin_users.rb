ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  actions :index, :show, :destroy, :new, :create

  index do
    selectable_column
    column :email

    actions
  end

  show do
    attributes_table do
      row :email
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
