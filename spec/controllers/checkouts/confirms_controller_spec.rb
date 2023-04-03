RSpec.describe Checkouts::ConfirmsController, type: :controller do
  let(:user) { create(:user) }
  let!(:order) { create(:order, user_id: user.id, status: :confirm) }
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
end
