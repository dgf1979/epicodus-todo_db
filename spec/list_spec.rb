require("spec_helper")

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

  describe('#id') do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff"})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

end
