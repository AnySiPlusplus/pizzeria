ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, user_picture_attributes: %i[image _destroy id]

  index do
    selectable_column

    column :picture do |user|
      span image_tag(user&.user_picture&.image_url(:tiny)) if user.user_picture
    end

    id_column
    column :email

    actions
  end

  show do
    panel :picture do
      table do
        span image_tag(user.user_picture.image_url(:small)) if user.user_picture
      end
    end

    attributes_table do
      row :email
    end
  end

  form do |f|
    f.inputs do
      f.input :email

      inputs 'Images' do
        f.has_many :user_picture, new_record: true, allow_destroy: true do |img|
          img.input :image, as: :file
        end
      end
    end
    f.actions
  end
end
