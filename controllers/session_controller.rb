require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session.rb')

get '/sessions' do
  @session = Session.find_all()
  erb(:"session/show")
end
