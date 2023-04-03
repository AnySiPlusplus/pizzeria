RSpec.describe Checkouts::AddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:delivery) { create(:delivery) }
  let!(:order) { create(:order, user_id: user.id, status: :address, delivery: delivery) }
  let(:order_items) { create(:order_item, order_id: order.id) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:current_order).and_return(order)
    order_items
  end

  context 'when GET show' do
    it 'renders the show template' do
      get :show

      expect(response).to be_ok
    end
  end

  context 'when put update' do
    let(:params) { attributes_for(:shipping_address).except(:order) }

    it 'must be update shipping address' do
      put :update, params: { checkouts_address: params }

      expect(response.status).to eq(200)
    end
  end
end
