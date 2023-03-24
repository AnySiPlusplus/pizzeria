RSpec.describe 'Pizza', type: :feature do
  let!(:pizza) { create(:ordinary_pizza) }
  let(:admin_user) { create(:admin_user) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::Pizza::Index.new }

    before do
      login_as(admin_user, scope: :admin_user)
      page.load
    end

    context 'when admin located index path' do
      it { expect(page).to have_content(pizza.name) }
      it { expect(page).to have_content(pizza.price.format) }
    end

    context 'when admin delete pizza' do
      before do
        page.links.delete.click
        page.accept_alert
      end

      it { expect(page).to have_admin_success_flash }
    end
  end

  describe 'Create' do
    let(:page) { Pages::ActiveAdmin::Pizza::Create.new }
    let(:show_page) { Pages::ActiveAdmin::Pizza::Show.new }
    let(:params) { attributes_for(:ordinary_pizza, category: pizza.category, pizza_dimension: pizza.pizza_dimension).except(:type) }
    let(:index_page) { Pages::ActiveAdmin::Pizza::Index.new }

    context 'when admin redirect to pizza create path' do
      before do
        index_page.load
        index_page.create_button.click
      end

      it { expect(page).to have_current_path(new_admin_pizza_path) }
    end

    context 'when admin create pizza' do
      before do
        page.load
        page.fill_form(params)
        page.form.button.click
      end

      it { expect(show_page).to have_admin_success_flash }
      it { expect(page).to have_content(params[:name]) }
      it { expect(page).to have_content(params[:filling]) }
      it { expect(page).to have_content(params[:description]) }
    end

    context 'when admin create pizza and write wrong data' do
      before do
        page.load
        page.fill_form(params, invalid: true)
        page.form.button.click
      end

      it { expect(page).to have_admin_wrong_message }
    end
  end

  describe 'Show' do
    let(:page) { Pages::ActiveAdmin::Pizza::Show.new }
    let(:index_page) { Pages::ActiveAdmin::Pizza::Index.new }

    context 'when admin redirect to pizza show path' do
      before do
        index_page.load
        page.links.view.click
      end

      it { expect(page).to have_current_path(admin_pizza_path(pizza.id)) }
    end

    context 'when admin view pizza' do
      let!(:pizza) { create(:ordinary_pizza) }

      before do
        page.load(id: pizza.id)
      end

      it { expect(page).to have_content(pizza.name) }
    end
  end

  describe 'Edit' do
    let(:page) { Pages::ActiveAdmin::Pizza::Edit.new }
    let(:show_page) { Pages::ActiveAdmin::Pizza::Show.new }
    let(:index_page) { Pages::ActiveAdmin::Pizza::Index.new }

    context 'when admin redirect to pizza edit path' do
      before do
        index_page.load
        index_page.links.edit.click
      end

      it { expect(page).to have_current_path(edit_admin_pizza_path(pizza.id)) }
    end

    context 'when admin edit pizza' do
      before do
        page.load(id: pizza.id)
        page.fill_form(attributes_for(:ordinary_pizza, category: pizza.category, pizza_dimension: pizza.pizza_dimension,
                                              fillings: 'not repeated filling'))
      end

      it { expect { page.form.button.click }.to(change { Pizza.first.name }) }
      it { expect { page.form.button.click }.to(change { Pizza.first.fillings }) }
      it { expect { page.form.button.click }.to(change { Pizza.first.description }) }
    end

    context 'when admin add images to pizzas' do
      let(:params) do
        attributes_for(:ordinary_pizza, category: pizza.category, pizza_dimension: pizza.pizza_dimension,
                               fillings: 'not repeated pilling')
      end

      before do
        page.load(id: pizza.id)
        page.fill_form(params)
        page.add_picture
      end

      it { expect { page.form.button.click }.to(change { Pizza.first.pizza_pictures }) }
    end
  end
end
