require 'glorify'

before '/notes*' do
  halt 401 unless session[:user_id]
end

# GET routes return HTML

# LIST
get '/notes' do
  notes = Note.order :created_at

  content_type 'application/json'
  notes.to_json
end

# SHOW
get '/notes/:id' do
  note = Note.find params[:id]

  content_type 'application/json'
  note.to_json
end

# CREATE
post '/notes' do
  request.body.rewind
  body = JSON.parse request.body.read
  if (note = Note.create body)
    status 201
    content_type 'application/json'
    note.to_json
  else
    status 400
  end
end

# UPDATE
patch '/notes/:id' do
  note = Note.find params[:id]
  request.body.rewind
  body = JSON.parse request.body.read
  if (note and note.update_attributes body)
    status 204
  else
    status 400
  end
end

# DESTROY
delete '/notes/:id' do
  note = Note.find params[:id]
  note.destroy

  status 204
end
