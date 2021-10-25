require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:authors).dependent(:destroy) }
    it { should have_many(:books).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
