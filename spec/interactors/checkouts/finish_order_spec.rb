RSpec.describe Checkouts::FinishOrder do
  subject(:context) { described_class.call(current_order: order.decorate) }

  let(:order) { create(:order, status: 'confirm') }
  let(:order_item) { create(:order_item, order_id: order.id) }

  before do
    order_item
  end

  describe 'method call' do
    context 'when finis order' do
      it 'is update order price' do
        expect { context }.to change(order, :subtotal_cents)
      end

      it 'is update order_items price' do
        expect { context }.to(change { order.order_items.first.price_cents })
      end

      it 'is changed order status to complete' do
        expect { context }.to change(order, :status).from('confirm').to('complete')
      end

      it 'is update order completed_at' do
        expect { context }.to(change(order, :completed_at))
      end
    end
  end
end
