class AccessController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  #note here it is good practcie to use except because if you add something new actions here then you don't have to mention here everytine


  def menu
    # display text and links 
  end

  def login
    #login form
  end

  def attempt_login 
    if params[:username].present? && params[:password].present? #present is opposite of blank
      found_user = AdminUser.where(:username => params[:username]).first # .first is very optimized approch it will return the first match found and return array but we don't array 
      if found_user
        authorized_user = found_user.authenticate(params[:password])  #authenticate is a magic method
      end

    end
    if authorized_user #if we find the autherize user then we set a session for it 
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now Logged in."
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password Combination." #it is best practice to show the combination aaan maybe not
      render('login') #it handling the same request and flash did not show and show at the next page that it hit 
      #but by redirect it display the flash but , we loss our parameters, we could store the user name in session or provided in url 
      #solution to that we should use flash.now[:notice]
    end
  end
  def logout
      session[:user_id] = nil 
      flash[:notice] = "Logged out"
      redirect_to(access_login_path)
  end

  # private
  
  # def confirm_logged_in
  #   unless session[:user_id]
  #     flash[:notic] = "Please Login"
  #      redirect_to(access_login_path) 
  #      #we want not to show any other controller action unless user is login 
  #      #if that is the case we should move this to our main applicationController and 
  #      #add this line there before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  #   end
  # end

end

