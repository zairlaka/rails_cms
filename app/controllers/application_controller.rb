class ApplicationController < ActionController::Base

private
  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notic] = "Please Login"
       redirect_to(access_login_path) 
       #we want not to show any other controller action unless user is login 
       #if that is the case we should move this to our main applicationController and 
       #add this line there before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
    end
  end


end
