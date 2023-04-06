RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user_id: user.id) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'when GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
    end
  end

  context 'when GET show'
  it 'renders the index template' do
    get :show, params: { id: order.id }
    expect(response).to be_ok
  end
end
