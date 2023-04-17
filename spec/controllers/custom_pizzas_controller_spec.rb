RSpec.describe CustomPizzasController, type: :controller do
  let!(:order_item) { create(:order_item) }
  let!(:filling) { create(:filling) }

  describe '#edit' do
    it 'renders the edit template' do
      get :edit, params: { order_item_id: order_item.id }
      expect(response).to be_ok
    end
  end

  describe '#update' do
    it 'must be updated' do
      patch :update, params: { order_item_id: order_item.id, filling_id: filling.id }

      expect(response.status).to eq(204)
    end
  end

  describe '#new' do
    it 'must be render new path' do
      get :new

      expect(response).to be_ok
    end
  end
end
