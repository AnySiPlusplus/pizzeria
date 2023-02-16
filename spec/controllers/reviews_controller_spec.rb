RSpec.describe ReviewsController, type: :controller do
  describe '#create' do
    let(:user) { create :user }
    let(:pizza) { create(:pizza) }

    let(:review_params) { attributes_for(:review, pizza_id: pizza.id) }

    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'is create pizza review' do
      expect do
        post :create, params: { pizza_id: pizza.id, review: review_params }
      end.to change(Review, :count).from(0).to(1)
    end

    it 'redirect to pizza path after create review' do
      post :create, params: { pizza_id: pizza.id, review: review_params }

      expect(response).to redirect_to pizza_path(pizza.id)
    end
  end
end
