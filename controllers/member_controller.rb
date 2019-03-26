require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/session.rb')
also_reload('../models/*')

get '/members' do
  @member = Member.find_all()
  erb(:"member/show")
end

get '/members/new' do
  @sessions = Session.find_all
  erb(:"member/new")
end

post '/members' do
  @member = Member.new(params).save
  redirect to "/members"
end

# get '/member/:id/update' do
#   @member = Member.find(params[:id])
#   erb(:"member/edit")
# end
