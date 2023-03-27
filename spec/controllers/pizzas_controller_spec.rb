RSpec.describe PizzasController, type: :controller do
  context 'when GET index path' do
    it '#index' do
      get :index
      expect(response).to be_ok
    end
  end

  context 'when GET show path' do
    let(:pizza) { create(:ordinary_pizza) }

    it '#show' do
      get :show, params: { id: pizza.id }
      expect(response).to be_ok
    end
  end
end
