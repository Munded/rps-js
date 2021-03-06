require 'sinatra/base'
require 'rack-flash'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require_relative 'models/user'
require_relative 'models/game'

set :public_folder, proc { File.join(root) }

class RockPaperScissors < Sinatra::Base

  include Helpers

  enable :sessions
  set :sessions_secret, 'secret'

  use Rack::Flash
  use Rack::MethodOverride

  # get '/' do
  #   erb :index
  # end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

require_relative 'controllers/home'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/reset_password'
require_relative 'controllers/game'