RSpec.describe 'FastAuthentificate', type: :feature do
  let(:page) { Pages::FastAuthentificates::Show.new }

  context 'when a user logs into their account' do
    let(:user) { create(:user) }
    let(:params) { { email: user.email, password: user.password } }

    before do
      page.load
      page.fill_form_with_password(params)
      page.button_log_in.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('devise.sessions.signed_in')) }
  end

  context 'when a user use quick register' do
    let(:pizza_page) { Pages::Pizzas::Show.new }
    let!(:pizza) { create(:ordinary_pizza) }

    before do
      pizza_page.load(id: pizza.id)
      pizza_page.body.add_to_cart.click
      page.load
      page.quick_register(FFaker::Internet.email)
      page.button_continue_checkout.click
    end

    it { expect(page).to have_current_path(checkouts_address_path) }
  end

  context 'when a user use quick register and write wrong email' do
    before do
      page.load
      page.quick_register('wrong_email@test')
      page.button_continue_checkout.click
    end

    it { expect(page).to have_output_message_about_error }
    it { expect(page).to have_content(I18n.t('errors.users.invalid.email')) }
  end
end
