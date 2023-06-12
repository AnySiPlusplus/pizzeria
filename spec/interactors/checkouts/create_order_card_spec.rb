RSpec.describe Checkouts::CreateOrderCard do
  subject(:context) { described_class.call(current_order: order, params:) }

  let!(:order) { create(:order) }

  describe 'method call' do
    context 'when valid data' do
      let(:params) do
        ActionController::Parameters.new(checkouts_card: attributes_for(:card).except(:order))
      end

      it 'is create order card' do
        expect { context }.to change(order, :card)
      end

      it 'is created card' do
        expect { context }.to change(Card, :count).from(0).to(1)
      end

      it 'is changed status' do
        expect { context }.to change(order, :status).from('delivery').to('confirm')
      end
    end

    context 'when valid data it are created card' do
      let(:card) { Card.first }
      let(:params) do
        ActionController::Parameters.new(checkouts_card: attributes_for(:card).except(:order))
      end

      before { context }

      it 'is create card with card_name' do
        expect(card.card_name).to eq(params[:checkouts_card][:card_name])
      end

      it 'is create card with card_number' do
        expect(card.card_number).to eq(params[:checkouts_card][:card_number])
      end

      it 'is create card with validity' do
        expect(card.validity).to eq(params[:checkouts_card][:validity])
      end

      it 'is create card with cvv' do
        expect(card.cvv).to eq(params[:checkouts_card][:cvv].to_i)
      end
    end

    context 'when invalid data' do
      let(:params) do
        ActionController::Parameters.new(checkouts_card: attributes_for(:card, validity: 'wrong data').except(:order))
      end

      it 'is created empty card form' do
        expect { context }.to change(order, :card)
      end

      it 'is not created card' do
        expect { context }.not_to change(Card, :count)
      end
    end
  end
end
