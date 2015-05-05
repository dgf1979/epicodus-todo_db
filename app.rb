require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "to_do"})

get('/') do
  erb(:index)
end

get('/list/new') do
  erb(:new_list_form)
end

post('/list/new') do
  erb(:success)
end
