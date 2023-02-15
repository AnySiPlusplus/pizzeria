RSpec.describe 'PizzaDimension', type: :feature do
  let!(:pizza_dimension) { create(:pizza_dimension) }
  let(:admin_user) { create(:admin_user) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::PizzaDimension::Index.new }

    before do
      login_as(admin_user, scope: :admin_user)
      page.load
    end

    context 'when admin located index path' do
      it { expect(page).to have_content(pizza_dimension.dimension) }
    end

    context 'when admin delete pizza dimension' do
      before do
        page.links.delete.click
        page.accept_alert
      end

      it { expect(page).to have_admin_success_flash }
    end
  end

  describe 'Create' do
    let(:page) { Pages::ActiveAdmin::PizzaDimension::Create.new }
    let(:show_page) { Pages::ActiveAdmin::PizzaDimension::Show.new }
    let(:params) { attributes_for(:pizza_dimension) }
    let(:index_page) { Pages::ActiveAdmin::PizzaDimension::Index.new }

    context 'when admin redirect to pizza dimension create path' do
      before do
        index_page.load
        index_page.create_button.click
      end

      it { expect(page).to have_current_path(new_admin_pizza_dimension_path) }
    end

    context 'when admin create pizza dimension' do
      before do
        page.load
        page.fill_form(params)
        page.form.button.click
      end

      it { expect(show_page).to have_admin_success_flash }
      it { expect(page).to have_content(params[:name]) }
    end

    context 'when admin create pizza dimension and write wrong data' do
      before do
        page.load
        page.fill_form(params, invalid: true)
        page.form.button.click
      end

      it { expect(page).to have_admin_wrong_message }
    end
  end

  describe 'Show' do
    let(:page) { Pages::ActiveAdmin::PizzaDimension::Show.new }
    let(:index_page) { Pages::ActiveAdmin::PizzaDimension::Index.new }

    context 'when admin redirect to pizza_dimension show path' do
      before do
        index_page.load
        page.links.view.click
      end

      it { expect(page).to have_current_path(admin_pizza_dimension_path(pizza_dimension.id)) }
    end

    context 'when admin view pizza_dimension' do
      let!(:pizza_dimension) { create(:pizza_dimension) }

      before do
        page.load(id: pizza_dimension.id)
      end

      it { expect(page).to have_content(pizza_dimension.dimension) }
    end
  end

  describe 'Edit' do
    let(:page) { Pages::ActiveAdmin::PizzaDimension::Edit.new }
    let(:show_page) { Pages::ActiveAdmin::PizzaDimension::Show.new }
    let(:index_page) { Pages::ActiveAdmin::PizzaDimension::Index.new }

    context 'when admin redirect to pizza_dimension edit path' do
      before do
        index_page.load
        index_page.links.edit.click
      end

      it { expect(page).to have_current_path(edit_admin_pizza_dimension_path(pizza_dimension.id)) }
    end

    context 'when admin edit pizza_dimension' do
      before do
        page.load(id: pizza_dimension.id)
        page.fill_form(attributes_for(:pizza_dimension))
      end

      it { expect { page.form.button.click }.to(change { PizzaDimension.first.dimension }) }
    end
  end
end
