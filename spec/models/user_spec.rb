require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#Validations' do

    it 'Valid User with all atributes' do
      expect(User.new(name: 'name', username: 'username')).to be_valid
    end

    it 'Invalid user due to nil name' do
      expect(User.new(name: nil, username: 'username')).to_not be_valid
    end

    it 'Invalid user due to nil username' do
      expect(User.new(name: 'name', username: nil)).to_not be_valid
    end

    it 'Invalid user due to short username' do
      expect(User.new(name: 'name', username: 'nil')).to_not be_valid
    end

    it 'Invalid user due to long username' do
      expect(User.new(name: 'name', username: 'usernameistoolong')).to_not be_valid
    end
  end
end
