require("rspec")
require("pg")
require("to_do")
require("list")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM task *;")
    DB.exec("DELETE FROM list *;")
  end
end
