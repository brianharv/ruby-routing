require('pry')

class Word
  attr_accessor :name, :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes) 
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all 
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new({:name => self.name, :id => self.id})
  end
  
  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end
  
  def self.clear
    @@words = {}
    @@total_rows = 0
  end  

  def self.find(id)
    @@words[id]
  end
  
  def delete
    @@words.delete(self.id)
  end
  
  def update_word(new_name)
    @name = new_name
  end
  
  ## Definitions

  def definition
    Definition.find_by_board(self.id)
  end
  

end  