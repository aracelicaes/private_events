require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe '#User Validations' do
    let (:user) {User.new}

    it 'Validate the name and username of user' do
      user.name = 'name'
      user.username = 'username'
      expect(user.valid?).to be true
    end

    it 'Invalid nil name for user' do
      user.name = nil
      user.username = 'username'
      expect(user.valid?).to be false
    end

    it 'Invalid nil username for user' do
      user.name = 'name'
      user.username = nil
      expect(user.valid?).to be false
    end

    it 'Invalid username size too short' do
      user.name = 'name'
      user.username = 'one'
      expect(user.valid?).to be false
    end

    it 'Invalid username size too long' do
      user.name = 'name'
      user.username = 'username_too_long'
      expect(user.valid?).to be false
    end
  end
end
