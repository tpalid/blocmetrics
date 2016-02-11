class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You're in!"
      redirect_to root_path
    else
      flash[:error] = "We're sorry, there was an error signing you up."
      render "new"
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "Your information was updated."
      redirect_to root_url
    else
      flash[:error] = "There was an error updating your information.  Please try again."
      render :edit
    end
  end
  
  def destroy
    @user = current_user
    if @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Your account was deleted."
      redirect_to root_url
    else
      flash[:notice] = "There was an error deleting your account.  Please try again."
      render :edit
    end
  end

  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
