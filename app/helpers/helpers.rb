class Helpers

  def current_user

  end

  def is_logged_in?
    !!session[:user.id]
  end

end
