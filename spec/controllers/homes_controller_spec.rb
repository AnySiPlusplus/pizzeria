RSpec.describe HomesController, type: :controller do
  context 'when GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
    end
  end
end
