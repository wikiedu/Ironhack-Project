require 'rails_helper'

RSpec.describe Location, type: :model do
    location=Location.new(name: 'name', direction: 'direction', client_id: 1, internal_code: 'code')

    it 'not valid without a name' do
      location.name = nil
      expect(location).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(location).to_not be_valid
    end

    it 'not valid without a direction' do
      location.direction = nil
      expect(location).to_not be_valid
    end

    it 'not valid without a client_id' do
      location.client_id = nil
      expect(location).to_not be_valid
    end

    it 'not valid without a code' do
      location.internal_code = nil
      expect(location).to_not be_valid
    end
end
