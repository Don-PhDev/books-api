class Api::V1::BooksController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, except: [:index, :show]
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    books = Book.all

    render json: BooksSerializer.new(books).as_json
  end

  def show
    render json: @book
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: @books, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private

  def authenticate_user
    token, _options = token_and_options(request)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params
      .require(:book)
      .permit(
        :title,
        :publisher,
        :published_on,
        :author_id,
        :user_id
      )
  end
end
