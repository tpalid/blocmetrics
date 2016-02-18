class RegisteredApplicationsController < ApplicationController
  def index
    @user = current_user
    @registered_applications = @user.registered_applications
  end
  
  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    if @registered_application.save
      flash[:notice] = "Application was saved!"
      redirect_to registered_application_path(@registered_application)
    else
      flash[:error] = "There was an error saving the application.  Please try again."
      render :new
    end
  end
  
  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end
  
  def update
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.update_attributes(registered_application_params)
      flash[:notice] = "Your application was updated."
      redirect_to registered_application_path(@registered_application)
    else
      flash[:notice] = "There was an error updating your application.  Please try again."
      render :edit
    end
  end
  

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Your application was deleted"
      redirect_to registered_applications_path
    else
      flash[:notice] = "There was an error deleting your application. Please try again."
      render :edit
    end
  end
  
  private
  
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
