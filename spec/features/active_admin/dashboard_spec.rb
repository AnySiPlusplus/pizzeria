RSpec.describe 'Dashboard' do
  let(:admin_user) { create(:admin_user) }
  let(:page) { Pages::Dashboard::Index.new }

  before do
    login_as(admin_user, scope: :admin_user)
    page.load
  end

  context 'when admin visit dashboard' do
    it { expect(page.body).to have_title_dasboard }
  end
end
