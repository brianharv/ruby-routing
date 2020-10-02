require('pry')

class Word
  attr_reader :name, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes) do
    @name = attributes.fetch(:name)
    @id = atributes.fetch(:id)
  end

  def self.all do
    @@words.values()
  end

  def self.save
    @@words[self.id] = Word.new({:name => self.name, :id => self.id})
  end
  
  def ==(word_to_compare)
    self.name == word_to_compare.name()
  end
  
  def self.clear
    @@words = {}
    @@total_rows = 0
  end  

  def self.find(id)
    @@words[id]
  end  