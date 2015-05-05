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
  new_list = List.new({ :name => name})
  new_list.save()
  @all_lists = List.all()
  erb(:lists)
  #erb(:success)
end

get('/lists') do
  @all_lists = List.all()
  erb(:lists)
end

get('/list/:id') do
  id = params.fetch("id")
  @list = List.find(id)
  @tasks = Task.find(id)
  erb(:new_task_form)
end

post('/list/:id') do
  list_id = params.fetch("id")
  task_description = params.fetch('description')
  task_due_date = params.fetch('due_date')
  new_task = Task.new({ :description => task_description, :list_id => list_id, :due_date => task_due_date })
  new_task.save()
  @list = List.find(list_id)
  @tasks = Task.find(list_id)
  erb(:new_task_form)
end
