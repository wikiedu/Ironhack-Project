require 'rails_helper'

RSpec.describe Client, type: :model do

  it 'always need a name to add new client' do
    client = Client.new(name: 'client1')
    expect(client.name).to eq('client1')
  end
  
end
