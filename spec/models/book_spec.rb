require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:author) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_presence_of(:publisher) }
    it { should validate_presence_of(:published_on) }
  end
end
