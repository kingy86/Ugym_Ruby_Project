require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/session.rb')
also_reload('../models/*')

get '/members' do
  @member = Member.find_all()
  erb(:"member/index")
end

get '/members/new' do
  @sessions = Session.find_all
  erb(:"member/new")
end

post '/members' do
  @member = Member.new(params).save
  redirect to "/members"
end

get '/members/:id' do
  @member = Member.find(params['id'])
  erb(:"member/show")
end

get '/members/:id/edit' do
  @sessions = Session.find_all
  @member = Member.find(params['id'])
  erb(:"member/edit")
end

post '/members/:id' do
  member = Member.new(params)
  member.update

  redirect to "/members/#{params['id']}"
end

post '/members/:id/delete' do
  member = Member.find(params['id'])
  member.delete
  redirect to '/members'
end
