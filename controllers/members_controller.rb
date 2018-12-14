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
    @members = Member.all
    erb :'members/index'
  end

  # New - GET
  get "/members/new" do
    @member = Member.new
    erb :'members/new'
  end

  # Show - GET
  get "/members/:id" do
    id = params[:id].to_i

    @member = Member.find id

    erb :"members/show"
  end

  # Create - POST
  post "/members" do
    member = Member.new

    member.first_name = params[:first_name]
    member.last_name = params[:last_name]
    member.gender = params[:gender]
    member.origin = params[:origin]

    member.save

    redirect '/members'
  end

  # Edit - GET
  get "/members/:id/edit" do
    id = params[:id].to_i

    @member = Member.find id

    erb :"members/edit"
  end

  # Update - PUT
  put "/members/:id" do
    id = params[:id].to_i

    member = Member.find id

    member.first_name = params[:first_name]
    member.last_name = params[:last_name]
    member.gender = params[:gender]
    member.origin = params[:origin]

    member.save

  redirect '/members'
  end

  # Destroy - DELETE
  delete "/members/:id" do
    id = params[:id].to_i

    Member.destroy id

    redirect '/members'

  end




end
