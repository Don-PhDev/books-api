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
  let(:title) { Faker::Book.unique.title }
  let(:publisher) { Faker::Book.publisher }
  let(:published_on) { Date.today.year-rand(400) }
  let(:author_id) { Author.pluck(:id).sample }
  let(:user_id) { User.pluck(:id).sample }
  let(:params) do
    {
      book: {
        title: title,
        publisher: publisher,
        published_on: published_on,
        author_id: author_id,
        user_id: user_id
      }
    }
  end

  describe "GET /api/v1/books" do
    let!(:books) { create_list(:book, 3) }
    let(:expected_body) { books.as_json(json_format) }

    subject { get '/api/v1/books' }

    it 'returns list of all books' do
      subject
      expect(response.status).to eq(200)
      expect(response_body).to eq(expected_body)
    end
  end

  describe "GET /api/v1/books/:id" do
    let(:book) { create :book }

    subject { get "/api/v1/books/#{book.id}" }

    it 'returns a book' do
      subject
      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/v1/books" do
    subject { post '/api/v1/books', params: params }

    it 'creates new book' do
      expect{ subject }.to change { Book.count }.by 1
    end

    describe 'validations' do
      before do
        subject
      end

      context 'with valid input' do
        it 'returns success status' do
          expect(response.status).to eq(201)
        end
      end

      context 'with invalid input' do
        let(:title) { nil }

        it 'returns failed status' do
          expect(response.status).to eq(422)
        end
      end
    end
  end

  describe "PATCH /api/v1/books/:id" do
    let!(:book) { create :book }

    subject { patch "/api/v1/books/#{book.id}", params: params }

    context 'with valid input' do
      let(:title) { "New Title" }

      it 'returns success status' do
        subject
        expect(response.status).to eq(200)
      end

      it 'updates book info' do
        expect{ subject }.to change { Book.where(title: title).count }.by 1
      end
    end

    context 'with invalid input' do
      let(:title) { nil }

      it 'returns failed status' do
        subject
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /api/v1/books/:id" do
    let!(:book) { create :book }

    subject { delete "/api/v1/books/#{book.id}" }

    it 'reduces the book count' do
      expect{ subject }.to change { Book.count }.by -1
    end

    it 'deletes a book' do
      subject
      expect(response.status).to eq(204)
    end
  end
end
