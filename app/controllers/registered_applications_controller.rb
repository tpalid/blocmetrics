class RegisteredApplicationController < ApplicationController
  def index
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    if @registered_application.save
      flash[:notice] = "Application was saved!"
      redirect_to [@registered_application]
    else
      flash[:error] = "There was an error saving the application.  Please try again."
      render :new
    end
  end
  
  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end
  
  def updated
  end
  

  def destroy
  end
  
  private
  
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
end
