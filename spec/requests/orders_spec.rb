require 'rails_helper'

RSpec.describe "Orders", type: :request do
  context 'order' do
    let(:user) { FactoryBot.create(:user) }
    let(:order) { FactoryBot.create(:order, user_id: user.id) }

    describe 'index path' do
      it 'respond with http success status code' do
        get '/orders'

        expect(response).to have_http_status(:ok)
      end
    end

    describe 'show path' do
      it 'respond with http success status code' do
        get "/orders/#{order.id}"

        expect(response).to have_http_status(:ok)
      end

      it 'respond with the appropiate order' do
        get "/orders/#{order.id}"

        finded_order = JSON.parse(response.body)['data']

        expect(finded_order['amount']).to eq(order.amount)
      end
    end

    describe 'create path' do
      before(:each) do
        @params = { order: { amount: 500 } }
      end

      it 'respond with the created user' do
        expect { post "/users/#{user.id}/orders", params: @params, as: :json }.to change(Order, :count).by(1)

        created_order = JSON.parse(response.body)['data']

        expect(created_order['id']).not_to be_nil
        expect(created_order['amount']).to eq(@params[:order][:amount])
      end
    end

    describe 'update path' do
      before(:each) do
        @params_for_payment_status = { order: { payment_status: 'paid' } }
        @params_for_order_status = { order: { order_status: 'delivered' } }
      end

      it 'respond with the updated payment status for the order' do
        patch "/orders/#{order.id}", params: @params_for_payment_status

        updated_order = JSON.parse(response.body)['data']

        expect(updated_order['payment_status']).to eql(@params_for_payment_status[:order][:payment_status])
        expect(updated_order['payment_date']).not_to be_nil
      end

      it 'respond with the updated order status for the order' do
        patch "/orders/#{order.id}", params: @params_for_order_status

        updated_order = JSON.parse(response.body)['data']

        expect(updated_order['order_status']).to eql(@params_for_order_status[:order][:order_status])
        expect(updated_order['delivery_date']).not_to be_nil
      end
    end

    describe 'delete path' do
      before(:each) do
        @new_order = user.orders.create(amount: 200)
      end

      it 'returns empty body' do
        delete "/orders/#{@new_order.id}"

        expect(response.body).to be_empty
      end

      it 'deletes the requested order' do
        expect do
        delete "/orders/#{@new_order.id}"
        end.to change(Order, :count).by(-1)
      end
    end
  end
end
