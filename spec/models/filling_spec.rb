RSpec.describe Filling, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:pizza_fillings) }
    it { is_expected.to have_many(:pizzas).through(:pizza_fillings) }
  end
end
