RSpec.describe ShippingAddress, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:receiver_name).with_options(null: false) }
    it { is_expected.to have_db_column(:city).with_options(null: false) }
    it { is_expected.to have_db_column(:building).with_options(null: false) }
    it { is_expected.to have_db_column(:street).with_options(null: false) }
    it { is_expected.to have_db_column(:phone).with_options(null: false) }
  end
end
