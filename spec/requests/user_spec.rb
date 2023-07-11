require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'user' do
    let(:user) { FactoryBot.create(:user) }

    describe 'index path' do
      it 'respond with http success status code' do
        get '/users'

        expect(response).to have_http_status(:ok)
      end
    end

    describe 'show path' do
      it 'respond with http success status code' do
        get "/users/#{user.id}"

        expect(response).to have_http_status(:ok)
      end

      it 'respond with the appropiate user' do
        get "/users/#{user.id}"

        finded_user = JSON.parse(response.body)['data']

        expect(finded_user['name']).to eq(user.name)
      end
    end

    describe 'create path' do
      before(:each) do
        @params = { user: { name: 'Test User', email: 'testmail@mail.com' } }
      end

      it 'respond with the created user' do
        expect { post '/users', params: @params }.to change(User, :count).by(1)

        created_user = JSON.parse(response.body)['data']

        expect(created_user['id']).not_to be_nil
        expect(created_user['name']).to eq(@params[:user][:name])
        expect(created_user['email']).to eq(@params[:user][:email])
      end
    end

    describe 'update path' do
      before(:each) do
        @params = { user: { name: 'Updated User' } }
      end

      it 'respond with the updated user' do
        patch "/users/#{user.id}", params: @params

        updated_user = JSON.parse(response.body)['data']

        expect(updated_user['name']).to eql(@params[:user][:name])
      end
    end

    describe 'delete path' do
      before(:each) do
        @new_user = User.create(name: 'Test User', email: 'testmail@mail.com')
      end

      it 'returns empty body' do
        delete "/users/#{@new_user.id}"

        expect(response.body).to be_empty
      end

      it 'deletes the requested user' do
        expect do
        delete "/users/#{@new_user.id}"
        end.to change(User, :count).by(-1)
      end
    end
  end
end
