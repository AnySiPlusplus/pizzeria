RSpec.describe Picture, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:picturable) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:image_data) }
  end
end
