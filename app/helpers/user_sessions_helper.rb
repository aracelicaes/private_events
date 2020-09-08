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
    #User.find_by(username: session[:username])
  end
end
