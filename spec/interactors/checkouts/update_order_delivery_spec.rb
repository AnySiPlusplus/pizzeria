RSpec.describe Checkouts::UpdateOrderDelivery do
  subject(:context) { described_class.call(current_order: order, params:) }

  let!(:order) { create(:order, status: 'delivery') }
  let!(:delivery) { create(:delivery) }

  describe 'method call' do
    context 'when valid params' do
      let(:params) do
        ActionController::Parameters.new(delivery: { id: delivery.id })
      end

      it 'is update order delivery' do
        expect { context }.to change(order, :delivery)
      end

      it 'is changed order status' do
        expect { context }.to change(order, :status).from('delivery').to('payment')
      end
    end

    context 'when invalid data' do
      let(:params) { { test: :test } }

      it 'is not update order delivery' do
        expect { context }.not_to change(order, :delivery)
      end
    end
  end
end
