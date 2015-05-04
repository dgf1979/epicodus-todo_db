require("rspec")
require("pg")
require("list")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM list *;")
  end
end


describe(List) do
  describe("#==") do
    it("is the same list if name is the same") do
      list1 = List.new({:name => "Epicodus"})
      list2 = List.new({:name => "Epicodus"})
      expect(list1).to(eq(list2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a list to array of saved lists") do
      test_list = List.new({:name => "Epicodus"})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

end
