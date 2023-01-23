RSpec.describe 'Sign in', type: :feature, js: true do
  let(:page) { Pages::SignIn::Create.new }
  let(:user) { create(:user) }

  before { page.load }

  context 'when the login is successful' do
    before do
      page.sign_in_form.email_field.set user.email
      page.sign_in_form.password_field.set user.password
      page.button_log_in.click
      page.button_my_account.click
    end

    it { expect(page).to have_content(page.button_log_out.text) }
    it { expect(page).to have_content(page.button_my_account.text) }
    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.sessions.signed_in')) }
  end

  context 'when the write wrong data' do
    before do
      page.sign_in_form.email_field.set user.email
      page.sign_in_form.password_field.set 'test12345'
      page.button_log_in.click
    end

    it { expect(page).to have_danger_flash }
    it { expect(page).to have_content(I18n.t('devise.failure.not_found_in_database', authentication_keys: :Email)) }
  end

  context 'when click log out' do
    before do
      page.load
      page.sign_in_form.email_field.set user.email
      page.sign_in_form.password_field.set user.password
      page.button_log_in.click
      page.button_my_account.click
      page.button_log_out.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.sessions.signed_out')) }
  end

  context 'when log in with Github' do
    before do
      page.button_github.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.omniauth_callbacks.success', kind: :Github)) }
  end
end
