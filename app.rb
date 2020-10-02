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
  @word = Word.new({:name => name, :id => nil})
  @word.save()
  @words = Word.all
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @definitions = Definition.find_by_word(params[:id].to_i())
  #@definition = Definition.new({:title => title, :body => body, :word_id => @word.id, :id => nil})
  erb(:word)
end

post('/words/:id') do
  @word = Word.find(params[:id].to_i())
  title = params[:definition_title]
  body = params[:definition_body]
  @definition = Definition.new({:title => title, :body => body, :word_id => @word.id, :id => nil})
  @definition.save()
  @definitions = Definition.find_by_word(params[:id].to_i())
  erb(:word)
end
