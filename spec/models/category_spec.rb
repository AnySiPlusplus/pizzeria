RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:pizzas) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:name) }
  end
end
