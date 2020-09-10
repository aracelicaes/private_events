module UserSessionsHelper
  
  def logout
    session.destroy
  end

  def current_user
    if(session[:name])
      @current_user = User.find_by(username: session[:username])
    else
      @current_user = nil
    end
  end

  def current_user?
    if(session[:name])
      @current_user = User.find_by(username: session[:username])
      true
    else
      @current_user = nil
      false
    end
  end

end
