RSpec.describe Pizzas::CreateCustomPizza do
  subject(:context) { described_class.call(current_order: order, params: params) }

  let!(:order) { create(:order) }

  describe 'method call' do
    context 'when valid data' do
      let(:fillings) { create_list(:filling, 3).map(&:id).join(',') }
      let(:pizza_dimension) { create(:pizza_dimension) }
      let(:category) { create(:category, name: :Custom) }
      let(:params) do
        ActionController::Parameters.new(custom_pizza: { fillings: fillings,
                                                         pizza_dimension: pizza_dimension.dimension })
      end

      before { category }

      it 'is create order order_items' do
        expect { context }.to(change { Order.first.order_items })
      end

      it 'is created custom pizza' do
        expect { context }.to change(CustomPizza, :count).from(0).to(1)
      end
    end
  end
end
