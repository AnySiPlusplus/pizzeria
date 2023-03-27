RSpec.describe FillingsController, type: :controller do
  let!(:order_item) { create(:order_item) }
  let!(:filling) { create(:filling) }

  describe '#show' do
    it 'renders the show template' do
      get :show, params: { order_item_id: order_item.id }
      expect(response).to be_ok
    end
  end

  describe '#update' do
    it 'must be updated' do
      patch :update, params: { order_item_id: order_item.id, filling_id: filling.id }

      expect(response.status).to eq(204)
    end
  end
end
