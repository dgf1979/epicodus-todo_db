class Task
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description  = attributes.fetch(:description)
    @list_id = 0 #attributes.fetch(:list_id)
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description())
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM task;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO task (description) VALUES ('#{@description}');")
  end
end
