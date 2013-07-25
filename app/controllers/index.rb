get '/' do
  # Look in app/views/index.erb
  @notes = Note.order("created_at DESC")
  erb :index
end

get "/note/new" do
  erb :new_note
end

post "/note/new" do
  @note = Note.create(params[:note])
  redirect "/"
end

get "/note/:note_id/show" do
  @note = Note.find(params[:note_id])
  erb :edit_note
end

put "/note/edit" do
  @note = Note.find(params[:note][:id])
  if @note.update_attributes(params[:note])
    erb :edit_note
  else
    @errors = @note.errors
    erb :edit_note
  end
end

delete "/note/:note_id/delete" do
 params.inspect
 n = Note.find(params[:note_id])
 n.destroy
 redirect '/'
end 
  

