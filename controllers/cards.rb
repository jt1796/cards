get '/cards' do
  session[:username] = 'john'
  Cards.getDeck(params, session).to_json
end

get '/card/:id' do

end

post '/card' do

end
