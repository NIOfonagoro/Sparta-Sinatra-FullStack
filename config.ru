require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative 'models/Member.rb'
require_relative 'controllers/members_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run MembersController
