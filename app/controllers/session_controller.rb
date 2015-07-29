# NON-GET routes redirect to GET routes

# CREATE
post '/session' do
  session[:user_id] = 1

  redirect "/notes"
end

# DESTROY
delete '/session' do
  session[:user_id] = nil

  redirect '/'
end
