require 'sinatra'
require 'JSON'
require_relative 'lib/contextualise'

get '/' do
  'hello, again'
end

post '/' do
  payload = JSON.parse(request.body.read)
  Contextualise::AmbiguousText.add_context(payload)
end
