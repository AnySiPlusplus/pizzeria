RSpec.describe Checkouts::CompletesController, type: :controller do
  let(:user) { create(:user) }
  let!(:order) { create(:order, user_id: user.id, status: :complete) }
  let(:order_items) { create(:order_item, order_id: order.id) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    order_items
  end

  context 'when GET show' do
    it 'renders the show template' do
      get :show, params: { order_id: order.id }

      expect(response).to be_ok
    end
  end
end
