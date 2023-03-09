RSpec.describe PizzaFilling, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:pizza) }
    it { is_expected.to belong_to(:filling) }
  end
end
