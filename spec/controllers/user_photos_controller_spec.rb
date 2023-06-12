RSpec.describe UserPhotosController, type: :controller do
  let(:user) { create(:user) }
  let(:image) { fixture_file_upload('duck.png') }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'when GET edit' do
    it '#edit' do
      get :edit

      expect(response).to be_ok
    end
  end

  context 'when update photo' do
    it '#update' do
      expect do
        put :update, params: { picture: { image: } }
      end.to change(Picture, :count).from(0).to(1)
    end
  end

  context 'when destroy image' do
    it '#destroy' do
      delete :destroy

      expect(response.code).to eq('302')
    end
  end
end
