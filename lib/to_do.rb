class Task
  attr_reader(:description, :list_id, :due_date)

  define_method(:initialize) do |attributes|
    @description  = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = ""
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description())
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM task;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO task (description, list_id)
    VALUES ('#{@description}', #{@list_id});")
  end
end
