ActiveAdmin.register Filling do
  permit_params :name, :price_cents, :price_currency

  decorate_with FillingDecorator

  index do
    selectable_column

    column :name
    column :price, :format_price

    actions
  end

  show do
    attributes_table do
      row :name
      row :price, &:format_price
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price_cents

      f.actions
    end
  end
end
