class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in # this is a function which is define in application_controller, so it is accessible to all other controllers too.

  def index
    @admin_users = AdminUser.sorted # sorted is a lamda expression to shorten our code. it is define in AdminUser model
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params) #this is strong parameters /whitelisting
    if @admin_user.save
      #flash[:notice] = "Admin User Created Successfully." # or you could do like this your choice 
      redirect_to :admin_users_path, notice: "Admin User Created Successfully."
    else
      flash.now[:alert] = "could not created"
      render('new')
    end

  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notic] = "Admin User Updated Successfully."
      redirect_to admin_users_path
    else 
      render("edit")
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notic] = "Admin User destroyed Successfully."
    redirect_to admin_users_path

  end

  private
  
  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password) #password is virtual here permit :password, but not :password_digest
  end
end
