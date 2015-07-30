before '/' do
  redirect '/notes' if session[:user_id]
end

get '/' do
  @title = "REST Notes"

  erb :index
end
