require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end


post('/words') do
  name = params[:word_name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  @words = Word.all
  erb(:words)
end

get('/words/:id') do
  @words = Word.find(params[:id].to_i())
  erb(:word)
end
