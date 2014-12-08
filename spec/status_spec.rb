require 'rspec'
require 'httparty'

describe 'GET /status' do

  it 'should return 200 OK' do
    response = HTTParty.get('http://localhost/status')
    expect(true).to eq(false)
  end
end