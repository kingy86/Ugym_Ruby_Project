require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session.rb')

get '/sessions' do
  @session = Session.find_all()
  erb(:"session/index")
end

get '/sessions/new' do
  @session = Session.find_all
  erb(:'session/new')
end

post '/sessions' do
  @session = Session.new(params).save
  redirect to "/sessions"
end

get '/sessions/:id' do
  @session = Session.find(params['id'])
  erb (:'session/show')
end

get '/sessions/:id/edit' do
  @session = Session.find(params["id"])

  erb(:'session/edit')
end

post '/sessions/:id' do
  session = Session.new(params)
  session.update

  redirect to "/sessions/#{params['id']}"
end

post '/sessions/:id/delete' do
  session = Session.find(params['id'])
  session.delete

  redirect to "/sessions"
end
