require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe '.all' do
    it("returns an empty array") do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      expect(Word.all).to(eq([]))
    end
  end

  describe '#save' do
    it('saves instance of Word in array.') do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      new_word.save()
      expect(Word.all).to(eq([new_word]))
    end
  end

  describe '.clear' do
    it('clears the array of saved words') do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      new_word.save()
      newer_word = Word.new({:name => "Pizza", :id => nil})
      newer_word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe '.find' do
    it('finds a word by its unique id') do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      new_word.save()
      newer_word = Word.new({:name => "Pizza", :id => nil})
      newer_word.save()
      expect(Word.find(2)).to(eq(newer_word))
    end
  end

  describe '#==' do
    it('compares two words by their names. If they are the same name then they are equal.') do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      repeat_word = Word.new({:name => "Sandwich", :id => nil})
      expect(new_word).to(eq(repeat_word))
    end
  end

  describe '#delete' do
    it('deletes word from list') do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      new_word.save()
      newer_word = Word.new({:name => "Garbage", :id => nil})
      newer_word.save()
      new_word.delete()
      expect(Word.all).to(eq([newer_word]))
    end
  end

  describe 'update' do
    it('updates an already entered word from word list') do
      new_word = Word.new({:name => "Sandwich", :id => nil})
      new_word.save()
      new_word.update_word("Soundwich")
      expect(new_word.name).to(eq("Soundwich"))
    end
  end
end