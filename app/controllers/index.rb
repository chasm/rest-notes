require 'glorify'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/notes'
end

# GET routes return HTML

# LIST
get '/notes' do
  @notes = Note.order :created_at
  @title = "REST Notes"
  erb :index
end

# NEW (form)
get '/notes/new' do
  @title = "Add note :: REST Notes"
  erb :new
end

# SHOW
get '/notes/:id' do
  notes = Note.order :created_at
  @note = Note.find params[:id]
  @title = "Show note :: REST Notes"

  idx = notes.find_index @note

  @prev = idx == 0 ? nil : notes[idx - 1]
  @next = idx == (notes.length - 1) ? nil : notes[idx + 1]

  erb :show
end

# EDIT (form)
get '/notes/:id/edit' do
  @note = Note.find params[:id]
  @title = "Edit note :: REST Notes"

  erb :edit
end

# NON-GET route redirect to GET routes

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
