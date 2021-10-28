require 'rails_helper'

RSpec.describe AuthenticationController do
  let(:email) { Faker::Internet.email }
  let(:password) { "password" }
  let(:params) do
    {
      email: email,
      password: password
    }
  end

  describe 'POST /authenticate' do
    let(:token) { "123" }

    subject { post '/authenticate', params: params }

    describe 'validations' do
      before do
        subject
      end

      it 'authenticates the user' do
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq({ "token" => token })
      end

      context 'invalid params' do
        let(:email) { nil }
        let(:password) { "password" }

        it 'raises an errors' do
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
