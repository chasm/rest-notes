# CREATE
post '/users' do
  user = User.create params[:user],

  # Let's log the user in immediately
  session[:user_id] = user.id

  redirect "/notes"
end
