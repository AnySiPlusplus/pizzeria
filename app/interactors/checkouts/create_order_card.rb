module Checkouts
  class CreateOrderCard < BaseInteractor
    def call
      setup_form
      validate_params if context.params[:checkouts_card]
    end

    private

    def success_outcome
      context.card_form.save
      context.current_order.confirm!
    end

    def current_card
      @current_card ||= Card.find_by(card_number: permit_params[:card_number])
    end

    def return_current_card
      context.card_form = current_card
    end

    def validate_params
      context.card_form.validate(permit_params) ? success_outcome : context.fail!
    end

    def setup_form
      context.card_form = Checkouts::CardForm.new(card_form)
    end

    def card_form
      context.current_order.card || context.current_order.build_card
    end

    def permit_params
      @permit_params ||= context.params.require(:checkouts_card).permit(:card_name, :card_number, :validity, :cvv)
    end
  end
end
