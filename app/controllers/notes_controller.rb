require 'glorify'

before '/notes*' do
  halt 401 unless session[:user_id]
end

# GET routes return HTML

# LIST
get '/notes' do
  @notes = Note.order :created_at
  @title = "REST Notes"

  erb :"/notes/index"
end

# NEW (form)
get '/notes/new' do
  @title = "Add note :: REST Notes"

  erb :"/notes/new"
end

# SHOW
get '/notes/:id' do
  notes = Note.order :created_at
  @note = Note.find params[:id]
  @title = "Show note :: REST Notes"

  idx = notes.find_index @note

  @prev = idx == 0 ? nil : notes[idx - 1]
  @next = idx == (notes.length - 1) ? nil : notes[idx + 1]

  erb :"/notes/show"
end

# EDIT (form)
get '/notes/:id/edit' do
  @note = Note.find params[:id]
  @title = "Edit note :: REST Notes"

  erb :"/notes/edit"
end

# NON-GET routes redirect to GET routes

# CREATE
post '/notes' do
  note = Note.create params[:note]

  redirect "/notes/#{note.id}"
end

# UPDATE
patch '/notes/:id' do
  note = Note.find params[:id]
  note.update_attributes params[:note]

  redirect "/notes/#{note.id}"
end

# DESTROY
delete '/notes/:id' do
  note = Note.find params[:id]
  note.destroy

  redirect '/notes'
end
