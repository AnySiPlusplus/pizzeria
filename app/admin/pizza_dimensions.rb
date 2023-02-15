ActiveAdmin.register PizzaDimension do
  permit_params :dimension, :price_cents, :price_currency

  decorate_with PizzaDimensionDecorator

  index do
    selectable_column
    column :dimension
    column :price, :format_price

    actions
  end

  show do
    attributes_table do
      row :dimension
      row :price, :format_price
    end
  end

  form do |f|
    f.inputs do
      f.input :dimension
      f.input :price_cents

      f.actions
    end
  end
end
