RSpec.describe CartsController, type: :controller do
  describe '#show' do
    it 'renders the show template' do
      get :show
      expect(response).to be_ok
    end
  end
end
