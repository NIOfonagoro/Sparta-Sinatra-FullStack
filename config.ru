require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative 'models/.rb'
require_relative 'controllers/.rb'

use Rack::Reloader
use Rack::MethodOverride

run Controller
