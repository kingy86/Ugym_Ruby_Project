require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do

end

get '/member/new' do
  erb(:"member/new")
end

get '/member/:id/update' do
  @member = Member.find(params[:id])
  erb(:"member/edit")
end
