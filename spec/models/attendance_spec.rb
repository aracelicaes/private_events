require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context '#Associations' do
    it 'Attendance has a foreign_key from user_id' do
      association = Attendance.reflect_on_association(:user)
      expect(association.foreign_key).to eq('user_id')
    end

    it 'Attendance has foreign_key from event_id' do
      association = Attendance.reflect_on_association(:event)
      expect(association.foreign_key).to eq('event_id')
    end

    it 'Attendance belongs to User Class' do
      association = Attendance.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'Attendance belongs to Event Class' do
      association = Attendance.reflect_on_association(:event)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
