RSpec.describe 'Addresses', type: :feature do
  let(:user) { create(:user) }
  let(:params) { attributes_for(:address, type: 'Billing').except(:addressable) }
  let(:page) { Pages::Addresses::Edit.new }

  before do
    sign_in user
    page.load
  end

  context 'when valid data' do
    before do
      page.fill_form(params)
      page.billing_form.button.click
    end

    it { expect(page).to have_success_flash }
    it { expect(page).to have_content(I18n.t('notice.address_saved', type: 'Billing')) }
  end

  context 'when invalid data' do
    before do
      page.fill_form(params, invalid: true)
      page.billing_form.button.click
    end

    it { expect(page).to have_content(I18n.t('errors.addresses.invalid.phone')) }
  end
end
