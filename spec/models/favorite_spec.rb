require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    it { should validate_presence_of(:book_name) }
    it { should validate_presence_of(:chapter_num) }
    it { should validate_presence_of(:verse_num) }
    it { should validate_presence_of(:verse) }
  end

  describe 'validations' do
    it { should belong_to(:user) }
  end
end
