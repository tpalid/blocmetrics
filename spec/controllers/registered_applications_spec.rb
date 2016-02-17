require 'rails_helper'

RSpec.describe RegisteredApplicationsController do

  describe "GET #index" do

      it "populates an array of the user's registered_applications" do
        current_user = create(:user)
        app1 = create(:registered_application, user: @user)
        app2 = create(:registered_application, user: @user)
        get :index
        expect(assigns(:registered_applications)).to match_array([app1, app2])
      end
    end
    
  describe "GET #show" do
    it "assigns the requested application to @registered_application"
    it "renders the :show template"
  end
  
  describe "GET #new" do
    it "assigns a new appliaction to @registered_application"
    it "renders the :new template"
  end
    
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new application in the database"
      it "redirects to registered_applications#show"
    end
    
    context "without valid attributes" do
      it "does not save the application in the database"
      it "re-renders the :new template"
    end
  end
  
  describe "GET #edit" do
    it "assigns the requested application to @registered_application"
    it "renders the :edit template"
  end
  
  describe "POST #update" do
    context "with valid attributes" do
      it "updates the application in the database"
      it "redirects to registered_application#show"
    end
    
    context "without valid attributes" do
      it "does not update the application in the database"
      it "re-renders the :edit template"
    end
  end
  
  describe "DELETE #destroy" do
    it "deletes the contact from the database"
    it "redirects to users#index"
  end
      


end
