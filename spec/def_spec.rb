require('pry')

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
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

  describe('.clear') do
    it('clears the array of saved words') do
      def_one = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => nil})
      def_one.save()
      def_two = Definition.new({:title => "Dreams", :body => nil, :word_id => nil, :id => nil})
      def_two.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a definition by its unique id') do
      def_one = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => 1})
      def_one.save()
      def_two = Definition.new({:title => "Dreams", :body => nil, :word_id => nil, :id => 2})
      def_two.save()
      expect(Definition.find(2)).to(eq(def_two))
    end
  end

  describe('#delete') do
    it('deletes definition from word') do
      def_one = Definition.new({:title => "Rocket", :body => nil, :word_id => nil, :id => 1})
      def_one.save()
      def_two = Definition.new({:title => "Dreams", :body => nil, :word_id => nil, :id => 2})
      def_two.save()
      def_two.delete()
      expect(Definition.all).to(eq([def_one]))
    end
  end

  describe('#update_body') do
    it('updates aa definition') do
      def_one = Definition.new({:title => "Bucket", :body => "A vessel that can contain things.", :word_id => nil, :id => 1})
      def_one.save()
      def_one.update_body("Something you kick.", 2)
      expect(def_one.body).to(eq("Something you kick."))
    end
  end

end