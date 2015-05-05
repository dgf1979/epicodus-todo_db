class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name  = attributes.fetch(:name)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name())
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM list;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id")
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO list (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id_number|
    find_list = nil
    List.all().each() do |list|
      if list.id() == id_number
        find_list = list
      end
    end
    find_list
  end

end
