RSpec.describe 'Users', type: :feature do
  let(:user) { create(:user) }
  let(:page) { Pages::Users::Edit.new }

  before do
    sign_in user
    page.load
  end

  context 'when valid email' do
    before do
      page.email_form.email.set FFaker::Internet.email
      page.email_form.save_button.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.registrations.update_needs_confirmation')) }
  end

  context 'when invalid email' do
    before do
      page.email_form.email.set 'Test@t'
      page.email_form.save_button.click
    end

    it { expect(page).to have_content(I18n.t('errors.users.invalid.email')) }
  end

  context 'when valid password params' do
    before do
      page.fill_password_form(user)
      page.password_form.save_button.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.registrations.updated')) }
  end

  context 'when invalid password params' do
    before do
      page.fill_password_form(user, invalid: true)
      page.password_form.save_button.click
    end

    it { expect(page).to have_content(I18n.t('errors.messages.email_invalid')) }
  end

  context 'when delete account' do
    before do
      page.delete_account_form.check_box.click
      page.delete_account_form.button_delete.click
    end

    it { expect(page).to have_content(I18n.t('devise.registrations.destroyed')) }
  end
end
