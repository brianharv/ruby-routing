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

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/:id') do
  @words = Word.all
  erb(:word)
end

post('/words') do
  name = params[:word_name]
  @word = Word.new({:name => params[:word_name], :id => nil})
  @word.save()
  @words = Word.all
  erb(:words)
end
