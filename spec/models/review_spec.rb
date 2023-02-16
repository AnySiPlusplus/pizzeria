RSpec.describe Review, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:pizza) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:title).with_options(limit: 80, null: false) }
    it { is_expected.to have_db_column(:review_text).with_options(null: false) }
    it { is_expected.to have_db_column(:rating).with_options(default: 0) }
    it { is_expected.to have_db_column(:status) }
  end
end
