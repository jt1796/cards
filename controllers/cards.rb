get '/cards' do
  session[:username] = 'john'
  Cards.getDeck(params, session).to_json
end

get '/card/:id' do

end

post '/card' do
  body_as_hash = JSON.parse request.body.read
  Cards.createCard(body_as_hash, session).to_json
end
