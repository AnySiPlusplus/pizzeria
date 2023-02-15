RSpec.describe 'Categories', type: :feature do
  let!(:category) { create(:category) }
  let(:admin_user) { create(:admin_user) }

  before { login_as(admin_user, scope: :admin_user) }

  describe 'Index' do
    let(:page) { Pages::ActiveAdmin::Categories::Index.new }

    before do
      login_as(admin_user, scope: :admin_user)
      page.load
    end

    context 'when admin located index path' do
      it { expect(page).to have_content(category.name) }
    end

    context 'when admin delete category' do
      before do
        page.links.delete.click
        page.accept_alert
      end

      it { expect(page).to have_admin_success_flash }
    end
  end

  describe 'Create' do
    let(:page) { Pages::ActiveAdmin::Categories::Create.new }
    let(:show_page) { Pages::ActiveAdmin::Categories::Show.new }
    let(:params) { attributes_for(:category) }
    let(:index_page) { Pages::ActiveAdmin::Categories::Index.new }

    context 'when admin redirect to category create path' do
      before do
        index_page.load
        index_page.create_button.click
      end

      it { expect(page).to have_current_path(new_admin_category_path) }
    end

    context 'when admin create category' do
      before do
        page.load
        page.fill_form(params)
        page.form.button.click
      end

      it { expect(show_page).to have_admin_success_flash }
      it { expect(page).to have_content(params[:name]) }
    end

    context 'when admin create category and write wrong data' do
      before do
        page.load
        page.fill_form(params, invalid: true)
        page.form.button.click
      end

      it { expect(page).to have_admin_wrong_message }
    end
  end

  describe 'Show' do
    let(:page) { Pages::ActiveAdmin::Categories::Show.new }
    let(:index_page) { Pages::ActiveAdmin::Categories::Index.new }

    context 'when admin redirect to category show path' do
      before do
        index_page.load
        page.links.view.click
      end

      it { expect(page).to have_current_path(admin_category_path(category.id)) }
    end

    context 'when admin view category' do
      let!(:category) { create(:category) }

      before do
        page.load(id: category.id)
      end

      it { expect(page).to have_content(category.name) }
    end
  end

  describe 'Edit' do
    let(:page) { Pages::ActiveAdmin::Categories::Edit.new }
    let(:show_page) { Pages::ActiveAdmin::Categories::Show.new }
    let(:index_page) { Pages::ActiveAdmin::Categories::Index.new }

    context 'when admin redirect to category edit path' do
      before do
        index_page.load
        index_page.links.edit.click
      end

      it { expect(page).to have_current_path(edit_admin_category_path(category.id)) }
    end

    context 'when admin edit category' do
      before do
        page.load(id: category.id)
        page.fill_form(attributes_for(:category))
      end

      it { expect { page.form.button.click }.to(change { Category.first.name }) }
    end
  end
end
