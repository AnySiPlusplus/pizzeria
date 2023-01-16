RSpec.describe PizzaDimension, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:pizzas) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:dimension) }
    it { is_expected.to have_db_column(:price_cents).with_options(null: false) }
  end
end
