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
    it('creates path and page for all post words') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'Sandwich')
      click_on('Publish')
      expect(page).to have_content('Sandwich')
    end
  end

end