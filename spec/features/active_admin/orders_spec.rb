RSpec.describe 'Orders', type: :feature do
  let(:admin_user) { create(:admin_user) }
  let(:delivery) { create(:delivery) }
  let!(:order) { create(:order, delivery_id: delivery.id, status: :complete) }

  before do
    page.setup_card_to_order(attributes_for(:card).except(:order))
    page.setup_addresses_to_order(attributes_for(:shipping_address).except(:order))
    page.setup_delivery_to_order(delivery)
    login_as(admin_user, scope: :admin_user)
  end

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::Orders::Index.new }

    before { page.load }

    context 'when admin located orders path' do
      it { expect(page).to have_content(order.user.email) }
      it { expect(page).to have_content(order.delivery.name) }
      it { expect(page.links).to have_view }
      it { expect(page.links).to have_edit }
    end

    context 'when user click view button' do
      before { page.links.view.click }

      it { expect(page).to have_current_path(admin_order_path(order.id)) }
    end

    context 'when user click edit button' do
      before { page.links.edit.click }

      it { expect(page).to have_current_path(edit_admin_order_path(order.id)) }
    end
  end

  describe 'Show' do
    let(:page) { Pages::ActiveAdmin::Orders::Show.new }

    before { page.load(id: order.id) }

    context 'when admin visit show order path' do
      it { expect(page).to have_content(order.decorate.order_user_name) }
      it { expect(page).to have_content(order.status) }
      it { expect(page).to have_content(order.delivery.name) }
      it { expect(page).to have_button_edit }
    end
  end
end
