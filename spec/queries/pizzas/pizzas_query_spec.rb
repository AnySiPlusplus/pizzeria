RSpec.describe Pizzas::PizzasQuery do
  let(:result) { described_class.new(params).call }

  let(:first_pizza) { create(:pizza, name: 'B', price_cents: 900, created_at: Time.zone.local(2022)) }
  let(:second_pizza) { create(:pizza, name: 'A', price_cents: 1000, created_at: Time.zone.local(2021)) }

  context 'when user sort pizzas title asc' do
    let(:params) { { sort_by: 'title_asc' } }

    it { expect(result).to eq([second_pizza, first_pizza]) }
  end

  context 'when user sort pizzas title desc' do
    let(:params) { { sort_by: 'title_desc' } }

    it { expect(result).to eq([first_pizza, second_pizza]) }
  end

  context 'when user sort pizzas price low to higth' do
    let(:params) { { sort_by: 'price_asc' } }

    it { expect(result).to eq([first_pizza, second_pizza]) }
  end

  context 'when user sort pizzas price higth to low' do
    let(:params) { { sort_by: 'price_desc' } }

    it { expect(result).to eq([second_pizza, first_pizza]) }
  end

  context 'when user sort pizzas newest' do
    let(:params) { { sort_by: 'newest' } }

    it { expect(result).to eq([first_pizza, second_pizza]) }
  end

  context 'when user sort pizzas to category' do
    let(:category) { create(:category) }
    let(:pizza) { create(:pizza, category: category) }
    let(:params) { { category_id: category.id } }

    it { expect(result).to eq([pizza]) }
  end
end
