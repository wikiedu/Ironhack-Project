require 'rails_helper'

RSpec.describe Expedition, type: :model do
  it 'test valid states' do
    expedition = Expedition.create()
    expect(expedition.state).to eq('delivered' || 'undelivered')
  end
end
