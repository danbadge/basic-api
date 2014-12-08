require 'rspec'
require 'httparty'

describe 'GET /status' do

  it 'should return 200 OK' do
    uri = 'http://localhost:4567/status'
    puts 'GET ' + uri
    response = HTTParty.get(uri)
    puts 'Response'
    puts 'Status code: ' + response.code.to_s
    puts 'Body: ' + response.body
    expect(response.code).to eq(200)
    expect(response.body).to eq('200 OK')
  end
end