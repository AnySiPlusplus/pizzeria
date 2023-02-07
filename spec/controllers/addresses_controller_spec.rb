RSpec.describe AddressesController, type: :controller do
  let(:user) { create :user }
  let(:billing_address_params) { attributes_for :address, user_id: user.id, type: 'Billing' }
  let(:shipping_address_params) { attributes_for :address, user_id: user.id, type: 'Shipping' }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'when GET edit' do
    it '#edit' do
      get :edit
      expect(response).to be_ok
    end
  end

  context 'when update' do
    before do
      put :update, params: { billing: billing_address_params }
    end

    it 'has 200 status code' do
      expect(response).to be_ok
    end
  end

  context 'when create address' do
    it 'is saved billind address' do
      expect do
        put :update, params: { billing: billing_address_params }
      end.to change(Address, :count).from(0).to(1)
    end

    it 'saved shipping address' do
      expect do
        put :update, params: { shipping: shipping_address_params }
      end.to change(Address, :count).from(0).to(1)
    end
  end
end
