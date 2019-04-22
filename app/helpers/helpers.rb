class Helpers

  def current_user
    User.find(session[:user_id])
  end

  def is_logged_in?
    !!session[:user.id]
  end

end
