RSpec.describe Checkouts::DeliveriesController, type: :controller do
  let(:user) { create(:user) }
  let!(:order) { create(:order, user_id: user.id, status: :delivery) }
  let(:order_items) { create(:order_item, order_id: order.id) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    order_items
  end

  describe 'when GET show' do
    it 'renders the show template' do
      get :show

      expect(response).to be_ok
    end
  end

  describe 'when PUT update' do
    let(:delivery) { create(:delivery) }

    context 'when redirect to payment path' do
      before do
        put :update, params: { delivery: { id: delivery.id } }
      end

      it 'is return 302 code' do
        expect(response.code).to eq('302')
      end

      it 'is redirect to checkout address path' do
        expect(response).to redirect_to(checkouts_address_path)
      end
    end

    context 'when changed order status to payment' do
      it 'is changed order status' do
        expect do
          put :update, params: { delivery: { id: delivery.id } }
        end.to change { Order.first.delivery_id }.from(nil).to(delivery.id)
      end
    end

    context 'when invalid params' do
      before { put :update }

      it 'is redirect get back' do
        expect(response.code).to eq('302')
      end

      it 'shouls be redirect to delivery path' do
        expect(response).to redirect_to(checkouts_delivery_path)
      end
    end
  end
end
