Note.destroy_all

Note.create [
  {
    intent: "**RETRIEVE** the *collection*",
    response: "`200 OK` Content-Type: **text/html**",
    explanation: %{
`GET` /notes &rarr; notes#index

Returns HTML. (All GETs return HTML.)

Here is a typical implementation in Sinatra:

```ruby
get '/notes' do
  @notes = Note.all

  erb :index
end
```

And in Rails:

```ruby
def index
  @notes = Note.order :created_at
end
```

(To be visible inside the ERB template, we need to make our variables
*instance* variables, which we do by prepending the @ sign.)
    }.strip
  },
  {
    intent: "**RETRIEVE** an *item*",
    response: "`200 OK` Content-Type: **text/html**",
    explanation: %{
`GET` /notes/:id &rarr; notes#show(:id)

Returns HTML. (All GETs return HTML.)

Here is a typical implementation in Sinatra:

```ruby
get '/notes/:id' do
  @note = Note.find params[:id]

  erb :show
end
```

And in Rails:

```ruby
def show
  @note = Note.find params[:id]
end
```
    }.strip
  },
  {
    intent: "Display the **ADD** form",
    response: "`200 OK` Content-Type: **text/html**",
    explanation: %{
`GET` /notes/new &rarr; notes#new

Returns HTML. (All GETs return HTML.)

Here is a typical implementation in Sinatra:

```ruby
get '/notes/:id' do
  erb :new
end
```

And in Rails:

```ruby
def new
  @note = Note.new
end
```

(Rails typically uses a form helper method, which uses a blank instance of the
object to help to create the form, so we create one here.)
    }.strip
  },
  {
    intent: "Display the **EDIT** form",
    response: "`200 OK` Content-Type: **text/html**",
    explanation: %{
`GET` /notes/:id/edit &rarr; notes#edit(:id)

Returns HTML. (All GETs return HTML.)

Here is a typical implementation in Sinatra:

```ruby
get '/notes/:id/edit' do
  @note = Note.find params[:id]

  erb :edit
end
```

And in Rails:

```ruby
def edit
  @note = Note.find params[:id]
end
```
    }.strip
  },
  {
    intent: "**CREATE** a new item",
    response: "`303 See Other` Location: http://munat.org/notes/3",
    explanation: %{
`POST` /notes &rarr; notes#create

*Redirects, typically to the show page for this item.*

Here is a typical implementation in Sinatra:

```ruby
post '/notes' do
  note = Note.create params[:note]

  redirect '/notes/note.id'
end
```

(We don't need an instance variable because we are redirecting. There is not
ERB template.)

And in Rails:

```ruby
def create
  note = Note.create params[:note]

  redirect_to note_url(note)
end
```

These examples assume that the title field, for example, has the name attribute
set to &ldquo;note[title]&rdquo; rather than just &ldquo;title&rdquo;.

(Modern rails apps sanitize input before doing the call to `create`
using something called `strong_parameters`.)
    }.strip
  },
  {
    intent: "**UPDATE** an item",
    response: "`303 See Other` Location: http://munat.org/notes/:id",
    explanation: %{
`PATCH` /notes/:id &rarr; notes#update(:id)

*Redirects, typically to the show page for this item.*

Here is a typical implementation in Sinatra:

```ruby
patch '/notes/:id' do
  note = Note.find params[:id]
  note.update_attributes params[:note]

  redirect '/notes/:id'
end
```

And in Rails:

```ruby
def update
  note = Note.find params[:id]
  note.update_attributes params[:note]

  redirect_to note_url(note)
end
```

These examples assume that the title field, for example, has the name attribute
set to &ldquo;note[title]&rdquo; rather than just &ldquo;title&rdquo;.

(Modern rails apps sanitize input before doing the call to `create`
using something called `strong_parameters`.)
    }.strip
  },
  {
    intent: "**DELETE** an item",
    response: "`303 See Other` Location: http://munat.org/notes",
    explanation: %{
`DELETE` /notes/:id &rarr; notes#destroy(:id)

*Redirects, typically to the list page for this class as there is no longer
an item with this ID to show.*

Here is a typical implementation in Sinatra:

```ruby
delete '/notes/:id' do
  note = Note.find params[:id]
  note.destroy

  redirect '/notes'
end
```

And in Rails:

```ruby
def update
  note = Note.find params[:id]
  note.destroy

  redirect_to notes_url
end
```
    }.strip
  }
]
