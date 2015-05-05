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
  name = params.fetch('name')
  new_list = List.new({ :name => name })
  new_list.save()

  erb(:success)
end

get('/lists') do
  @all_lists = List.all()
  erb(:lists)
end
