require 'rails_helper'

RSpec.describe 'Api::V1::Tasks', type: :request do
  let(:auth_headers) { { 'Authorization' => "Bearer #{jwt}" } }
  let(:jwt) { JsonWebToken.encode({ user_id: user.id }) }
  let(:user) { create(:user) }

  describe 'POST /tasks' do
    subject(:post_request) { post '/api/v1/tasks', params: params, headers: auth_headers }

    let(:params) do
      { task: build(:task).attributes.compact }
    end

    context 'when params are valid' do
      it 'creates a task' do
        expect { post_request }.to change(Task, :count).by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when header is invalid' do
      let(:jwt) { JsonWebToken.encode({ user_id: 2 }) }

      it 'returns unprocessable entity' do
        post_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /tasks:id' do
    subject(:get_request) { get "/api/v1/tasks/#{task.id}", params: params, headers: auth_headers }

    let(:params) { { id: task.id } }
    let(:task) { create(:task, user_id: user.id) }

    context 'when params are valid' do
      it 'returns a task' do
        get_request
        expect(response).to have_http_status(:success)
      end
    end

    context 'when header is invalid' do
      let(:jwt) { JsonWebToken.encode({ user_id: create(:user).id }) }

      it 'returns unprocessable entity' do
        get_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'UPDATE /tasks:id' do
    subject(:put_request) { put "/api/v1/tasks/#{task.id}", params: params, headers: auth_headers }

    let(:params) { { id: task.id, task: { title: 'test' } } }
    let(:task) { create(:task, user_id: user.id) }

    context 'when params are valid' do
      it 'returns a task' do
        put_request
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['title']).to eql('test')
      end
    end

    context 'when params are invalid' do
      let(:jwt) { JsonWebToken.encode({ user_id: create(:user).id }) }
      let(:params) { { id: task.id, title: nil } }

      it 'returns unprocessable entity' do
        put_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /tasks:id' do
    subject(:delete_request) do
      delete "/api/v1/tasks/#{task.id}", params: params, headers: auth_headers
    end

    let(:params) { { id: task.id } }
    let(:task) { create(:task, user_id: user.id) }

    context 'when params are valid' do
      it 'returns a task' do
        delete_request
        expect(response).to have_http_status(:success)
      end
    end
  end
end
