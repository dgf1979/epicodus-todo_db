class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name  = attributes.fetch(:name)
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name())
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM list;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      lists.push(List.new({:name => name}))
    end
    lists
  end

  define_method(:save) do
    DB.exec("INSERT INTO list (name) VALUES ('#{@name}');")
  end
end
