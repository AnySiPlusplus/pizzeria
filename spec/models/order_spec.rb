RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:pizzas).through(:order_items) }
  end
end
