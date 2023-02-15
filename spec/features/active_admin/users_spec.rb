RSpec.describe 'Users', type: :feature do
  let(:admin_user) { create(:admin_user) }
  let!(:user) { create(:user) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::Users::Index.new }

    before { page.load }

    context 'when admin located admin users path' do
      it { expect(page).to have_content(admin_user.email) }
      it { expect(page.links).to have_view }
      it { expect(page.links).to have_delete }
    end

    context 'when admin click view button' do
      before { page.links.view.click }

      it { expect(page).to have_current_path(admin_user_path(user.id)) }
    end

    context 'when admin click delete button' do
      before do
        page.links.delete.click
        page.accept_alert
      end

      it { expect(page).to have_current_path(admin_users_path) }
    end

    context 'when admin click create user button' do
      before { page.create_button.click }

      it { expect(page).to have_current_path(new_admin_user_path) }
    end
  end
end
