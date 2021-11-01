require 'rails_helper'

RSpec.describe Api::V1::AuthorsController do
  let!(:user) { create :user }
  let(:json_format) do
    {
      except: %i[
        created_at
        updated_at
      ]
    }
  end
  let(:name) { Faker::Book.author }
  let(:params) do
    {
      author: {
        name: name,
        user_id: User.pluck(:id).sample
      }
    }
  end

  describe "GET /index" do
    let!(:authors) { create_list(:author, 3) }
    let(:expected_body) { authors.as_json(json_format) }

    subject { get '/api/v1/authors' }

    it 'returns list of all authors' do
      subject
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq(expected_body)
    end
  end

  describe "GET /show" do
    let(:author) { create :author }

    subject { get "/api/v1/authors/#{author.id}" }

    it 'returns an author' do
      subject
      expect(response.status).to eq(200)
    end
  end

  describe "POST /create" do
    subject { post '/api/v1/authors', params: params }

    it 'creates new author' do
      expect{ subject }.to change { Author.count }.by 1
    end

    it 'returns success status' do
      subject
      expect(response.status).to eq(201)
    end

    context 'with invalid input' do
      let(:name) { nil }

      it 'return failed status' do
        subject
        expect(response.status).to eq(422)
      end
    end
  end
end
