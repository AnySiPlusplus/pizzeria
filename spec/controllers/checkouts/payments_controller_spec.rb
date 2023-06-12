RSpec.describe Checkouts::PaymentsController, type: :controller do
  let(:user) { create(:user) }
  let!(:order) { create(:order, user_id: user.id, status: :payment) }
  let(:order_items) { create(:order_item, order_id: order.id) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:current_order).and_return(order)
    order_items
  end

  describe 'when GET show' do
    it 'renders the show template' do
      get :show

      expect(response).to be_ok
    end
  end

  describe 'when create card' do
    let(:params) { attributes_for(:card).except(:order) }

    it 'must create card' do
      post :create, params: { checkouts_card: params }

      expect(response.status).to eq(302)
    end
  end

  describe 'when update payment' do
    let(:params) { { pay_cash: { cash: 1 } } }

    it 'must use payment without card' do
      put(:update, params:)

      expect(response.status).to eq(302)
    end
  end
end
