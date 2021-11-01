require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:authors).dependent(:destroy) }
    it { should have_many(:books).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email)
      .is_at_least(2)
      .with_short_message("Email must have at least 2 characters")
      .is_at_most(30)
      .with_long_message("Email must be less than 30 characters")
    }
  end
end
