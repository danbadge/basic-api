require 'sinatra/base'

class StatusResource < Sinatra::Base

  get '/status' do
    '200 OK'
  end

end