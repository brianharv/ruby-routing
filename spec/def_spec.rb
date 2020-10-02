require('pry')

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new({:name => "Rocket", :id => nil})
    @word.save()
  end

  describe('#==') do
    it("matches two definitions if the title and id are the same") do
      def_one = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => nil})
      def_two = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => nil})
      expect(def_one).to(eq(def_two))
    end
  end

  describe('.all') do
    it("returns an empty array") do
      def_one = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => nil})
      def_two = Definition.new({:title => "Dreams", :body => nil, :word_id => nil, :id => nil})
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      def_one = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => nil})
      def_one.save()
      def_two = Definition.new({:title => "Dreams", :body => nil, :word_id => nil, :id => nil})
      def_two.save()
      expect(Definition.all).to(eq([def_one, def_two]))
    end
  end

  

end