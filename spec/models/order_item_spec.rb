RSpec.describe OrderItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:pizza) }
    it { is_expected.to belong_to(:order) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:quantity).with_options(default: 1) }
  end
end
