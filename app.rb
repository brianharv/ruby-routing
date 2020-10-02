require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')


## Words


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

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update_word(params[:word_name])
  redirect to('/words')
end


## Definitions

get('/words/:id/definition/:definition_id')do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  @word_id = params[:id]
  erb(:definition)
end


delete('/words/:id/definition/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete()
  @word = Word.find(params[:id].to_i())
  redirect to('/words')
end

patch('/words/:id/definition/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update_body(params[:definition_body], @word.id)
  redirect to('/words')
end


