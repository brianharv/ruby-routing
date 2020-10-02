require('capybara/rspec')
require('./app,rb')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '#Word' do
  
  before(:each) do
    Word.clear()
  end

  describe('create initial patch', {:type => :feature}) do
    it('creates a landing page') do
      visit('/')
      expect(page).to have_content('Sandwich')
    end
  end

  describe('create /words patch', {:type => :feature}) do
    it('creates path and page for all post words') do
      visit('/words')
      expect(page).to have_content('Sandwich')
    end
  end
  
end