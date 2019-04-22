require 'sinatra/base'

class Helpers

  def current_user(session)
    @user = User.find(session[:user_id])
  end

  def is_logged_in?(session)
    !!session[:user.id]
  end

end
