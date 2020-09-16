require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#Validations' do
    let(:user) { User.new(name: 'name', username: 'username', id: 3) }
    let(:event_1) { Event.new(title: 'Independencia') }

    it 'Event is valid with all attributes' do
      expect(Event.new(title: 'Independencia', date: Date.tomorrow, creator: user)).to be_valid
    end

    it 'Event is invalid due to empty attributes' do
      expect(event_1).to_not be_valid
    end

    it 'Event is invalid due to empty title' do
      expect(Event.new(date: Date.tomorrow, creator: user)).to_not be_valid
    end

    it 'Event is invalid due to empty date' do
      expect(Event.new(title: 'Independencia', creator: user)).to_not be_valid
    end

    it 'Event is invalid due to empty creator' do
      expect(Event.new(title: 'Independencia', date: Date.tomorrow)).to_not be_valid
    end
  end

  context '#Associations' do
    it 'Event has a foreign_key from user id' do
      association = Event.reflect_on_association(:creator)
      expect(association.foreign_key).to eq(:user_id)
    end

    it 'Event has many attendances' do
      association = Event.reflect_on_association(:attendances)
      expect(association.macro).to eq(:has_many)
    end

    it 'Event has many attendees through attendances w/user source' do
      association = Event.reflect_on_association(:attendees)
      expect(association.macro).to eq(:has_many)
    end

    it 'Event does not belong to attendances' do
      association = Event.reflect_on_association(:attendances)
      expect(association.macro).to_not eq(:belongs_to)
    end

    it 'Event does not belong to attendee' do
      association = Event.reflect_on_association(:attendees)
      expect(association.macro).to_not eq(:belongs_to)
    end
  end
end
