require_relative '../../config/environment'
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
      session[:id] = @user[:id]
      redirect to '/account'
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do

  end


end
