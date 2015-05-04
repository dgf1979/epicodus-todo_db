require("rspec")
require("pg")
require("to_do")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM task *;")
  end
end


describe(Task) do
  describe("#==") do
    it("is the same task if description is the same") do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end
end
