RSpec.describe 'Sign up', type: :feature do
  let(:page) { Pages::SignUp::Create.new }
  
  context 'when valid data' do
    before do
      page.load
      page.sign_up_form.email_field.set FFaker::Internet.email
      page.sign_up_form.password_field.set 'Password1'
      page.sign_up_form.confirm_password.set 'Password1'
      page.button_sign_up.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.registrations.signed_up_but_unconfirmed')) }
  end

  context 'when invalid data' do
    before do
      page.load
      page.sign_up_form.email_field.set FFaker::Internet.email
      page.sign_up_form.password_field.set 'wrong'
      page.sign_up_form.confirm_password.set 'wrong'
      page.button_sign_up.click
    end

    it { expect(page.sign_up_form).to have_password_has_error }
  end
end
