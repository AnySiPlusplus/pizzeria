RSpec.describe FastAuthentificatesController, type: :controller do
  describe '#Show' do
    it 'renders the show template' do
      get :show
      expect(response).to be_ok
    end
  end

  describe '#create' do
    it 'renders create template' do
      post :create, params: { users_privacy_email: { email: FFaker::Internet.email } }

      expect(response.code).to eq('302')
    end

    it 'is redirect to checkout_path' do
      post :create, params: { users_privacy_email: { email: FFaker::Internet.email } }

      expect(response).to redirect_to(checkouts_address_path)
    end

    it 'is created user' do
      expect do
        post :create, params: { users_privacy_email: { email: FFaker::Internet.email } }
      end.to(change(User, :count).from(0).to(1))
    end

    it 'shouldn`t created user' do
      expect do
        post :create, params: { users_privacy_email: { email: 'Wrong_email' } }
      end.not_to(change(User, :count))
    end

    it 'is come back to fast_autentificate_path' do
      post :create, params: { users_privacy_email: { email: 'Wrong_email' } }

      expect(response).to be_ok
    end
  end
end
