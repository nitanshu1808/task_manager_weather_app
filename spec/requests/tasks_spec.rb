require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'GET /index' do
    let(:user) { build_stubbed(:user) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'returns http success' do
        get '/'
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to sign in' do
        get '/'
        expect(response).to have_http_status(:found)
      end
    end
  end
end
