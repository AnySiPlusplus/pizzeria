module Session
  class OrderSession < BaseInteractor
    def call
      return order_current_user unless context.current_user.nil?

      context.session = Order.find_or_create_by(id: context.id)
      context.id = context.session.id
    end

    private

    def order_current_user
      context.session = Order.find_or_create_by(user_id: context.current_user.id)
    end
  end
end
