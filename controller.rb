require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/member.rb')
require_relative('./models/session.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end
