RSpec.describe Address, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:first_name).with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:last_name).with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:address).with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:city).with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:country).with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:phone).with_options(limit: 15, null: false) }
    it { is_expected.to have_db_column(:type).with_options(limit: 50, null: false) }
  end
end
