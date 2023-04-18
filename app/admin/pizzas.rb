ACTION_INDEX = 'index'.freeze

ActiveAdmin.register Pizza do
  permit_params :name, :price_cents, :price_currency, :filling, :description, :category_id, :pizza_dimension_id,
                pizza_pictures_attributes: %i[image _destroy id], filling_ids: []

  controller do
    def scoped_collection
      action_name == ACTION_INDEX ? super.includes(%i[category pizza_pictures fillings]) : super
    end
  end

  decorate_with PizzaDecorator

  index do
    selectable_column

    column :picture do |pizza|
      first_image = pizza.pizza_pictures.map do |image|
        image_tag(image.image_url(:thumbnail))
      end.first
      span first_image
    end

    column :name
    column :filling_full_names
    column :category
    column :description, &:short_description
    column :price, :format_price

    actions
  end

  show do
    attributes_table do
      panel :pictures do
        table do
          pizza.pizza_pictures.each do |image|
            span image_tag(image.image_url(:small))
          end
        end
      end
      row :name
      row :filling_full_names
      row :category
      row :description
      row :dimension, &:pizza_dimension
      row :price, &:format_price
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :fillings, collection: Filling.all.decorate, multiple: true
      f.input :category
      f.input :description
      f.input :pizza_dimension, collection: PizzaDimension.all.decorate
      f.input :price_cents

      inputs 'Images' do
        f.has_many :pizza_pictures, new_record: true, allow_destroy: true do |img|
          img.input :image, as: :file
        end
      end

      f.actions
    end
  end
end
