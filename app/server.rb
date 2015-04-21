require 'sinatra/base'
require 'rack-flash'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require_relative 'models/user'

class RockPaperScissors < Sinatra::Base

  include Helpers

  enable :sessions
  set :sessions_secret, 'secret'

  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.new(user_name: params[:user_name],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user_name, password = params[:user_name], params[:password]
    user = User.authenticate(user_name, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash[:notice] = 'Good Bye!'
    session[:user_id] = nil
    redirect to '/'
  end

  get '/reset_password' do
    if params['email']
      user = User.first(email: params['email'])
      user.password_token = (1..64).map { ('A'..'Z').to_a.sample }.join
      user.password_token_timestamp = Time.now
      user.save
      erb :"/reset_password/confirmation"
    else
      erb :'/reset_password/request'
    end
  end

  get '/reset_password/:token' do
    user = User.first(password_token: params[:token])
    if Time.now > user.password_token_timestamp + (60 * 60)
      flash[:notice] = "Token time has expired!"
    else
      if params[:password]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
        user.password_token = nil
        user.password_token_timestamp = nil
        if user.save
          flash[:notice] = "Password changed!"
          redirect to('/user/new')
        else
          flash.now[:errors] = user.errors.full_messages
        end
      else
        @token = params[:token]
        erb :'/reset_password/change_password'
      end
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
