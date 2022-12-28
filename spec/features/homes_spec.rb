RSpec.describe 'Homes', type: :feature do
  let(:page) { Pages::Homes::Index.new }

  before do
    page.load
  end

  context 'when check header section' do
    it { expect(page.header).to have_logo }
    it { expect(page.header).to have_button_menu }
    it { expect(page.header).to have_button_home }
    it { expect(page.header).to have_button_sign_up }
    it { expect(page.header).to have_button_sign_in }
  end

  context 'when check section body' do
    it { expect(page.body).to have_welcome_text }
    it { expect(page.body).to have_button_get_started }
    it { expect(page.body).to have_best_sellers_text }
  end

  context 'when check section footer' do
    it { expect(page.footer).to have_link_home }
    it { expect(page.footer).to have_link_menu }
    it { expect(page.footer).to have_link_facebook }
    it { expect(page.footer).to have_link_twitter }
    it { expect(page.footer).to have_link_google_plus }
    it { expect(page.footer).to have_link_instagram }
  end
end
