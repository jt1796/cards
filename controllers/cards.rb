get '/cards' do
  @ready = Table_Generator.makeTable('ready', session[:username])
  @progress = Table_Generator.makeTable('progress', session[:username])
  @verified = Table_Generator.makeTable('verified', session[:username])
  erb :cards
end

get '/card' do
  sc = Stack_Container.new("users/" + session[:username]).getJSON()
  @stack = params[:stack]
  @title = params[:title]
  if @stack == 'ready'
    @disDemote = 'disabled'
  end
  if @stack == 'verified'
     @disPromote = 'disabled'
  end
  @body = sc[@stack][@title]['body']
  @acceptance = sc[@stack][@title]['acceptance']
  erb :card
end

get '/newcard' do
  erb :newcard
end

get '/add' do
  title = params[:title]
  body = params[:body]
  acceptance = params[:acceptance]
  sc = Stack_Container.new("users/" + session[:username])
  sc.add('ready', title, body, acceptance)
  redirect '/cards'
end

get '/action/*/*/*' do |action, stack, title|
    sc = Stack_Container.new("users/" + session[:username])
    if (action == 'edit')
        sc.remove(stack, title)
        sc.add(stack, title, params[:body], params[:acceptance])
    end
    if (action == 'promote')
        dst = 'progress' if stack == 'ready'
        dst = 'verified' if stack == 'progress'
        sc.transfer(stack, dst, title)
    end
    if (action == 'demote')
        dst = 'ready' if stack == 'progress'
        dst = 'progress' if stack == 'verified'
        sc.transfer(stack, dst, title)
    end
    redirect '/cards'
end
