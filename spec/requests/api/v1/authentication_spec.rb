require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController do
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
      post '/api/v1/authenticate', params: params

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)).to eq({ "token" => token })
    end

    describe 'validations' do
      let(:email) { nil }
      let(:password) { nil }

      context 'with invalid params' do
        it 'raises an error' do
          post '/api/v1/authenticate', params: { email: email, password: password }

          expect(response.status).to eq(422)
        end
      end

      context 'when password is incorrect' do
        let(:wrong_password) { "incorrect-password" }

        it 'raises an error' do
          post '/api/v1/authenticate', params: {
            email: user.email,
            password: "incorrect-password"
          }

          expect(response.status).to eq(401)
        end
      end
    end
  end
end
