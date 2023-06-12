RSpec.describe Reviews::ReviewForm do
  subject(:form) { described_class.new(Review.new(user:)) }

  let(:user) { create(:user) }
  let(:params) do
    {
      rating:,
      title:,
      review_text:,
      user_id: user.id,
      pizza_id: pizza.id
    }
  end
  let(:pizza) { create(:pizza) }

  before { form.validate(params) }

  context 'when params valid' do
    let(:rating) { rand(described_class::ONE_STAR..described_class::MAX_STARS) }
    let(:title) { FFaker::Book.title }
    let(:review_text) { FFaker::Book.description }

    it { expect(form.valid?).to eq(true) }
  end

  context 'when params invalid' do
    let(:rating) { rand(described_class::ONE_STAR..described_class::MAX_STARS) }
    let(:title) { '' }
    let(:review_text) { FFaker::Book.description }

    it { expect(form.valid?).to eq(false) }
  end
end
