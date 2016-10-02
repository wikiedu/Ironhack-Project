require 'rails_helper'

RSpec.describe Expedition, type: :model do

  expedition=Expedition.new(origin_location_id: 1, destination_location_id: 2, state: 'undelivered', date: DateTime.now)

  it 'test valid states' do
    expedition = Expedition.create()
    expect(expedition.state).to eq('delivered' || 'undelivered')
  end

  it 'not valid without a state' do
    expedition.state = nil
    expect(expedition).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(expedition).to_not be_valid
  end

  it 'not valid without origin' do
    expedition.origin_location_id = nil
    expect(expedition).to_not be_valid
  end

  it 'not valid without destination' do
    expedition.origin_location_id = nil
    expect(expedition).to_not be_valid
  end

  it 'not valid with the same origin and destination' do
    expedition.origin_location_id = 1
    expedition.destination_location_id = 2

    expect(expedition.origin_location_id).to_not be(expedition.destination_location_id)
  end

  it 'not valid without date' do
    expedition.date = nil
    expect(expedition).to_not be_valid
  end


end
