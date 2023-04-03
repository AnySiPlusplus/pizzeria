RSpec.describe Delivery, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:orders) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:name).with_options(null: false) }
    it { is_expected.to have_db_column(:time).with_options(null: false) }
    it { is_expected.to have_db_column(:price_cents).with_options(null: false) }
  end
end
