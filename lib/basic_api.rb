require 'sinatra/base'
require_relative 'status_resource'

class BasicApi < Sinatra::Base

  use StatusResource

end