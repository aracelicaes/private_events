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

  context '#Associations' do
    it 'user has many events' do
      association = User.reflect_on_association(:events)
      expect(association.macro).to eq(:has_many)
    end
    it 'user has many attendances' do
      association = User.reflect_on_association(:attendances)
      expect(association.macro).to eq(:has_many)
    end

    it 'user has many attended_events' do
      association = User.reflect_on_association(:attended_events)
      expect(association.macro).to eq(:has_many)
    end

    it 'user does not belongs to events' do
      association = User.reflect_on_association(:events)
      expect(association.macro).to_not eq(:belongs_to)
    end
    it 'user does not belongs to attendances' do
      association = User.reflect_on_association(:attendances)
      expect(association.macro).to_not eq(:belongs_to)
    end

    it 'User does not belong to attended_events' do
      association = User.reflect_on_association(:attended_events)
      expect(association.macro).to_not eq(:belongs_to)
    end
  end
end
