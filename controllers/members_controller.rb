class MembersController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
      register Sinatra::Reloader
  end

  # Index - GET
  get "/members" do

    erb :'members/index'
  end

  # New - GET
  get "/members/new" do
    erb :'members/new'
  end

  # Show - GET
  get "/members/:id" do
    erb :"members/show"
  end

  # Create - POST
  post "/members" do

  end

  # Edit - GET
  get "/members/:id/edit" do
    erb :"members/edit"
  end
  # Update - PUT
  put "/memebers/:id" do

  end

  # Destroy - DELETE
  delete "/members/:id" do

  end




end