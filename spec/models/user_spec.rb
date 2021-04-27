require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:favorites).with_foreign_key(:created_by) }
    it { should have_many(:comments).with_foreign_key(:written_by) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('example@email.domain').for(:email) }
  end
end