class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #returns an array of all messages as JSON, ordered by created_at in ascending order
  get '/messages' do
    messages = Message.order(created_by: :asc)
    messages.to_json
  end

  #creates a new message with a body and username from params, and returns a newly created post as JSON
  post '/messages' do
    messages = Message.create(
      body: params[:body],
      username: params[:username]
    )
    messages.to_json
  end

  #updates the body of the message using params, and returns the update message as JSON
  patch '/messages/:id' do
    messages = Message.find(params[:id])
    messages.update(
      body: params[:body]
    )
    messages.to_json
  end

  # deletes the message from the database
  delete '/messages/:id' do
    messages = Message.find(params[:id])
    messages.destroy
    messages.to_json
  end
end
