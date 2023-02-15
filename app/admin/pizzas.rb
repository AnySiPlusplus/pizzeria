ACTION_INDEX = 'index'.freeze

ActiveAdmin.register Pizza do
  permit_params :name, :price_cents, :price_currency, :filling, :description, :category_id, :pizza_dimension_id

  controller do
    def scoped_collection
      action_name == ACTION_INDEX ? super.includes(%i[category pizza_dimension]) : super
    end
  end

  decorate_with PizzaDecorator

  index do
    selectable_column
    column :name
    column :filling
    column :category
    column :description, &:short_description
    column :dimension, :pizza_dimension
    column :price, :format_price

    actions
  end

  show do
    attributes_table do
      row :name
      row :filling
      row :category
      row :description
      row :dimension, &:pizza_dimension
      row :price, &:format_price
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :filling
      f.input :category
      f.input :description
      f.input :pizza_dimension, collection: PizzaDimension.all.decorate
      f.input :price_cents

      f.actions
    end
  end
end
