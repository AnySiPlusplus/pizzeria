RSpec.describe OrderItemsController, type: :controller do
  let!(:order_item) { create(:order_item) }
  let(:order_item_params) { attributes_for(:order_item, pizza_id: order_item.pizza.id, order_id: order_item.order.id) }

  describe '#destroy' do
    let(:result) { post :destroy, params: { order_id: order_item.order.id, id: order_item.id } }

    before do
      allow(controller).to receive(:current_order).and_return(order_item.order)
    end

    it 'redirect to cart_parh after destroy' do
      expect(result.status).to eq(204)
    end

    context 'when destroy order item' do
      it 'is destroy items' do
        expect { result }.to(change(OrderItem, :count).from(1).to(0))
      end
    end
  end

  describe '#create' do
    it 'redirect to pizza_path after create order_item' do
      post :create, params: { order_id: order_item.order.id, order_item: order_item_params }

      expect(response).to redirect_to pizzas_path
    end
  end

  describe '#update' do
    before do
      allow(controller).to receive(:current_order).and_return(order_item.order)
    end

    it 'redirect to cart path after update order item' do
      post :update, params: { id: order_item.id, order_item: { quantity: 1, pizza_id: order_item.pizza.id } }

      expect(response.status).to eq(204)
    end
  end
end
