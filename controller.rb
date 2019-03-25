require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/member_controller.rb')
require_relative('./controllers/session_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:index)
end
