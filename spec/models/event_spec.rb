require 'rails_helper'

RSpec.describe Event, type: :model do

  describe '#Event Validations' do
    let (:user) {User.new(name: 'name', username: 'username', id: 3)}
    let (:event_1) {Event.new(title: 'Independencia')}
    
    it 'Invalid Event due to nil data' do
      expect(event_1).to_not be_valid
    end

    it 'Valid Event with all attributes' do
      expect(Event.new(title: 'Independencia', date: Date.tomorrow, creator: user)).to be_valid
    end
  end
end
