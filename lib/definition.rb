class Definition
  attr_accessor :title, :body, :id, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @body = attributes.fetch(:body)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end
  
  def self.all 
    @@definitions.values()
  end

  def save
    @@definitions[self.id] = Definition.new({:title => self.title, :body => self.body, :word_id => self.word_id, :id => self.id})
  end
  
  def ==(definition_to_compare)
    self.title() == definition_to_compare.title() && self.word_id() == definition_to_compare.word_id()
  end
  
  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end  

  def self.find(id)
    @@definitions[id]
  end
  
  def update_body(new_body)
    @body = new_body
  end
  
  def delete
    @@definitions.delete(self.id)
  end
  
  def word
    Word.find(self.word_id)
  end
  
  def self.find_by_word(id)
    def_array = []
    @@definitions.values.each do |definition|
      if definition.word_id == id
        def_array.push(definition)
      end
    end
    def_array
  end
end        
