RSpec.describe Pizza, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:pizza_dimension) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:description).with_options(null: false) }
    it { is_expected.to have_db_column(:name).with_options(null: false) }
    it { is_expected.to have_db_column(:price_cents).with_options(null: false) }
  end
end
