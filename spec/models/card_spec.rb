RSpec.describe Card, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:card_number).with_options(null: false) }
    it { is_expected.to have_db_column(:card_name).with_options(null: false) }
    it { is_expected.to have_db_column(:validity).with_options(null: false) }
    it { is_expected.to have_db_column(:cvv).with_options(null: false) }
    it { is_expected.to have_db_column(:order_id).with_options(null: false) }
  end
end
