require 'rails_helper'

RSpec.describe AuthenticationController do
  let(:user) { create :user }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end

  describe 'POST /authenticate' do
    let(:token) { AuthenticationTokenService.call(user.id) }

    it 'authenticates the user' do
      post '/authenticate', params: params

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)).to eq({ "token" => token })
    end

    context 'invalid params' do
      it 'raises an error' do
        post '/authenticate', params: { email: nil }

        expect(response.status).to eq(422)
      end
    end
  end
end
