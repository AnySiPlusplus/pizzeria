RSpec.describe 'AdminUsers', type: :feature do
  let(:admin_user) { create(:admin_user) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::AdminUsers::Index.new }

    before { page.load }

    context 'when admin located admin users path' do
      it { expect(page).to have_content(admin_user.email) }
      it { expect(page.links).to have_view }
      it { expect(page.links).to have_delete }
    end

    context 'when admin click view button' do
      before { page.links.view.click }

      it { expect(page).to have_current_path(admin_admin_user_path(admin_user.id)) }
    end

    context 'when admin click delete button' do
      before do
        page.links.delete.click
        page.accept_alert
      end

      it { expect(page).to have_current_path(new_admin_user_session_path) }
    end

    context 'when admin click create user button' do
      before { page.create_button.click }

      it { expect(page).to have_current_path(new_admin_admin_user_path) }
    end
  end

  describe 'Create' do
    let(:page) { Pages::ActiveAdmin::AdminUsers::Create.new }

    before { page.load }

    context 'when admin create user' do
      let(:params) { attributes_for(:admin_user) }

      before do
        page.fill_form(params)
        page.create_admin_user.click
      end

      it { expect(page).to have_content(params[:eamil]) }
    end

    context 'when admin create user and write wrong data' do
      let(:params) { attributes_for(:admin_user) }

      before do
        page.fill_form(params, invalid: true)
        page.create_admin_user.click
      end

      it { expect(page).to have_admin_wrong_message }
    end
  end
end
