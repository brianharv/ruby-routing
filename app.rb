source('https://rubygems.org')

gem('sinatra')      
gem('sinatra-contrib')
gem('rspec')
gem('capybara', '~> 3.33')
gem('pry')

get('/') do
  @words = Word.all
  erb(:words)
end