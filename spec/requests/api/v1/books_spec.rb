require 'rails_helper'

RSpec.describe Api::V1::BooksController do
  let!(:user) { create :user }
  let!(:author) { create :author }
  let(:json_format) do
    {
      except: %i[
        created_at
        updated_at
      ]
    }
  end

  describe "GET /api/v1/books" do
    let!(:books) { create_list(:book, 3) }
    let(:expected_body) { books.as_json(json_format) }

    subject { get '/api/v1/books' }

    it 'returns list of all books' do
      subject
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq(expected_body)
    end
  end
end
