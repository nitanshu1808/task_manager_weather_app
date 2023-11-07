require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :request do
  describe 'POST /users' do
    subject(:post_request) { post '/users', params: params }

    let(:user) { build(:user) }
    let(:location) do
      { name: FFaker::Address.country }
    end

    let(:params) do
      {
        user: {
          password: user.password,
          password_confirmation: user.password,
          location_attributes: location,
        }.merge(user.attributes.compact),
      }
    end

    context 'with valid parameters' do
      it 'creates a new user with location' do
        expect { post_request }.to change(User, :count).by(1).and change(Location, :count).by(1)
      end

      it 'redirects to the task index page' do
        post_request
        expect(response).to redirect_to('/')
      end
    end

    shared_examples 'invalid user params' do
      it 'does not create a user and location' do
        expect { post_request }.to change(User, :count).by(0).and change(Location, :count).by(0)
      end
    end

    context 'when params are not valid' do
      context 'when location is not present' do
        let(:location) { nil }

        include_examples 'invalid user params'
      end

      context 'when email is not present' do
        before { params[:user][:email] = nil }

        include_examples 'invalid user params'
      end
    end
  end
end
