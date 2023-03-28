module Orders
  class FindOrCreate < BaseInteractor
    STATUS = %i[address delivery payment confirm].freeze

    def call
      return order_current_user unless context.current_user.nil?

      context.order = Order.find_or_create_by(id: context.id)
      context.id = context.order.id
    end

    private

    def order_current_user
      return context.order = find_order if find_order

      context.order = Order.create(user_id: context.current_user.id)
    end

    def find_order
      @find_order ||= Order.find_by(user_id: context.current_user.id, status: STATUS)
    end
  end
end
