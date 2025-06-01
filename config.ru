require 'rack'
require_relative './lib/api'

use Rack::Reloader, 0

run Api.new
