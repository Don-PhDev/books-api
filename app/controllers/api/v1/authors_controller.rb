class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :destroy]

  def index
    @authors = Author.all

    render json: @authors,
      except: [
        :created_at,
        :updated_at
      ]
  end

  def show
    render json: @author
  end

  def create
    author = Author.new(author_params)

    if author.save
      render json: @authors, status: :created
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      render json: @authors, status: :no_content
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :user_id)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
