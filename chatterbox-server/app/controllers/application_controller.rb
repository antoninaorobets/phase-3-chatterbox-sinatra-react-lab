class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    # binding.pry
    Message.all.order(:created_at).to_json
  end

  post '/messages' do
    Message.create(body: params[:body], username: params[:username]).to_json
  end

  patch '/messages/:id' do
    updated_message = Message.find(params[:id])
    updated_message.update(body: params[:body])
    updated_message.to_json
  end

  delete '/messages/:id' do
   
    remove = Message.find(params[:id])
    remove.destroy
  end
 
  
end
