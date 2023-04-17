RSpec.describe CustomPizzas::CustomPizzaForm do
  subject(:form) { described_class.new(CustomPizza.new(fillings: fillings)) }

  let(:fillings) { create_list(:filling, 3) }
  let(:category) { create(:category) }
  let(:params) do
    {
      name: name,
      description: description,
      price_cents: price_cents,
      category_id: category.id
    }
  end

  before { form.validate(params) }

  context 'when params valid' do
    let(:name) { FFaker::Address.city }
    let(:description) { FFaker::Lorem.characters(400) }
    let(:price_cents) { rand(5000..10_000) }

    it { expect(form.valid?).to eq(true) }
  end

  context 'when params invalid' do
    let(:name) { '' }
    let(:description) { '' }
    let(:price_cents) { '' }

    it { expect(form.valid?).to eq(false) }
  end
end
