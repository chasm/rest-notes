# NON-GET routes redirect to GET routes

# CREATE
post '/session' do
  user = User.find_by_email(params[:email])

  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/notes"
  else
    redirect "/"
  end

end

# DESTROY
delete '/session' do
  session[:user_id] = nil

  redirect '/'
end
