ACTION_SHOW = 'show'.freeze

ActiveAdmin.register Order do
  permit_params :user_id, :delivery_id, :subtotal_cents, :subtotal_currency, :status,
                order_items_attributes: %i[order_items _destroy id quantity pizza_id]

  controller do
    def scoped_collection
      return super if action_name == ACTION_SHOW
      return super.includes({ order_items: :pizza }) unless action_name == ACTION_INDEX

      super.includes(%i[user delivery]).where(status: Order::FINISHED_STATUSES.keys)
    end
  end

  actions :index, :show, :update, :edit
  decorate_with OrderDecorator

  scope :all
  scope :complete
  scope :in_progress
  scope :in_delivery
  scope :delivered
  scope :canceled

  index do
    selectable_column

    column :user
    column :delivery
    column :subtotal_cents, &:format
    column :status
    actions
  end

  show title: proc { |order| t('checkouts.completes.show.order_id', number: order.order_number) } do
    attributes_table do
      row :user
      row :name, &:receiver
      row :receiver_phone, &:receiver_phone
      row :card_number, &:check_number_card
      row :status
      row :delivery
    end

    panel(t('.products')) do
      table_for(order.order_items.includes([:pizza])) do
        column t('.pizza_name') do |item|
          item.pizza.name
        end
        column t('.quantity'), &:quantity
        column t('.price') do |item|
          item.pizza.price.format
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :delivery
      f.input :subtotal_cents
      f.input :status, collection: Order::FINISHED_STATUSES.keys
    end

    f.inputs t('.order_items') do
      f.has_many :order_items, collection: Pizza.all.decorate, multiple: true, allow_destroy: true do |a|
        a.input :pizza
        a.input :quantity
      end
    end
    f.actions
  end
end
