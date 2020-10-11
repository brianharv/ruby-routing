require('capybara/rspec')
require('./app.rb')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end

  describe('create initial patch', {:type => :feature}) do
    it('creates a landing page') do
      visit('/')
      expect(page).to have_content('')
    end
  end

  describe('create /words path', {:type => :feature}) do
    it('creates path and page for all posted words') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'Sandwich')
      click_on('Publish')
      expect(page).to have_content('Sandwich')
    end
  end

  describe('create definition path', {:type => :feature}) do
    it('creates path and page for definitions') do  
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'Sandwich')
      click_on('Publish')
      click_on('Sandwich')
      fill_in('definition_title', :with => 'FAV')
      click_on('Add Definition')
      expect(page).to have_content('FAV')
    end
  end

  describe('edit a word', {:type => :feature}) do
    it('allows user to edit word') do
      word = Word.new({:name => "Cheese", :id => nil})
      word.save
      visit("/words/#{word.id}")
      click_on('Edit Word')
      fill_in("word_name", :with => 'Taco')
      click_on('Update')
      expect(page).to have_content('Taco')
    end
  end
  
  describe('delete a word', {:type => :feature}) do
    it('allows user to delete word') do
      word1 = Word.new({:name => "Cheese", :id => nil})
      word1.save
      word2 = Word.new({:name => "Taco", :id => nil})
      word2.save
      visit("/words/#{word1.id}")
      click_on('Delete Word')
    
      expect(page).to have_content('Taco')
    end
  end  

  describe('edit a definition', {:type => :feature}) do
    it('allows user to edit definition') do
      word = Word.new({:name => "Cheese", :id => nil})
      word.save
      definition = Definition.new({:title => "Pure Heaven", :body => "Am I dreaming or eating?", :word_id => nil, :id => nil})
      definition.save
      visit("/words/#{word.id}")
      visit("/words/#{word.id}/definition/#{definition.id}")
      fill_in("definition_body", :with => 'The perfect food')
      click_on('Update')
      expect(definition.body).to(eq('The perfect food'))
    end
  end
  
  describe('delete a definition', {:type => :feature}) do
    it('allows user to delete a definition') do
      word = Word.new({:name => "Cheese", :id => nil})
      word.save
      definition1 = Definition.new({:title => "Pure Heaven", :body => "Am I dreaming or eating?", :word_id => nil, :id => nil})
      definition1.save
      definition2 = Definition.new({:title => "My Favorite", :body => "Put it on a burger, put it on a pizza, put it on a sandwich. It's perfect.", :word_id => nil, :id => nil})
      definition2.save
      visit("/words/#{word.id}/definition/#{definition1.id}")
      click_on('Delete Definition')
      expect(page.has_content?(definition1)).to eq(false)
    end
  end 

  
end