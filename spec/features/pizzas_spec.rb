RSpec.describe 'Pizzas', type: :feature do
  describe 'Index' do
    let(:page) { Pages::Pizzas::Index.new }
    let(:category) { create(:category) }
    let!(:pizzas) { create_list(:ordinary_pizza, 13, category:) }

    before do
      page.load
    end

    context 'when check body section' do
      let!(:pizzas) { create(:ordinary_pizza, category:) }

      before { page.body.button_sort_by.click }

      it { expect(page.body).to have_button_all }
      it { expect(page.button_category).to include(category.name) }
      it { expect(page.pizza).to include(pizzas.name) }
      it { expect(page.body).to have_button_sort_by }
      it { expect(page.body).to have_button_name_asc }
      it { expect(page.body).to have_button_name_desc }
      it { expect(page.body).to have_button_most_popular }
      it { expect(page.body).to have_button_price_asc }
      it { expect(page.body).to have_button_price_desc }
      it { expect(page.body).to have_button_newest }
    end

    context 'when have view more button' do
      it { expect(page.body).to have_button_view_more }
    end

    context 'when click button view more' do
      before { page.body.button_view_more.click }

      it { expect(page.pizzas_count).to eq(13) }
    end

    context 'when click button sort by name desc' do
      before do
        page.body.button_sort_by.click
        page.body.button_name_desc.click
      end

      it { expect { page.body.pizzas }.to(change { page.body.pizzas }) }
    end

    context 'when click button sort by price asc' do
      before do
        page.body.button_sort_by.click
        page.body.button_price_asc.click
      end

      it { expect { page.body.pizzas }.to(change { page.body.pizzas }) }
    end

    context 'when click button sort by price desc' do
      before do
        page.body.button_sort_by.click
        page.body.button_price_desc.click
      end

      it { expect { page.body.pizzas }.to(change { page.body.pizzas }) }
    end

    context 'when click button sort by newest' do
      before do
        page.body.button_sort_by.click
        page.body.button_newest.click
      end

      it { expect { page.body.pizzas }.to(change { page.body.pizzas }) }
    end

    context 'when hover pizza image' do
      let!(:pizzas) { create(:ordinary_pizza, category:) }

      before do
        page.body.pizzas.first.hover
        page.button_show.click
      end

      it 'is redirect to pizza path' do
        expect(page).to have_current_path(pizza_path(pizzas.id))
      end
    end
  end
end
