require_relative '../../config/environment'
require '../helpers/helpers'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "My session secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:login])
    if @user
      session[:user_id] = @user[:id]
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/account' do
    binding.pry
    if is_logged_in?
        @username = current_user.username
        @balance = current_user.balance
      else
        redirect to '/error'
      end
    erb :account
  end

  get '/logout' do

  end


end
