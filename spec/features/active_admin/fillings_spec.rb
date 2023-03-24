RSpec.describe 'Fillings', type: :feature do
  let!(:filling) { create(:filling) }
  let(:admin_user) { create(:admin_user) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::Fillings::Index.new }

    before do
      login_as(admin_user, scope: :admin_user)
      page.load
    end

    context 'when admin located index path' do
      it { expect(page).to have_content(filling.name) }
      it { expect(page).to have_content(filling.price.format) }
    end

    context 'when admin delete filling' do
      before do
        page.links.delete.click
        page.accept_alert
      end

      it { expect(page).to have_admin_success_flash }
    end
  end
end
