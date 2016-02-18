require 'rails_helper'

RSpec.describe RegisteredApplicationsController do

  describe "GET #index" do
    context "with a valid user" do
        before do
          @user = create(:user_with_registered_applications)
          session[:user_id] = @user.id
        end

        it "populates an array of the current user's registered_applications" do
          get :index, id: @user
          expect(assigns(:registered_applications)).to match_array(@user.registered_applications)
        end
        
        it "renders the :index template" do
          get :index, id: @user
          expect(response).to render_template :index
      end
   end
 end
    
  describe "GET #show" do
    let(:registered_application) { create(:registered_application) }
      
    it "assigns the requested application to @registered_application" do
      get :show, id: registered_application
      expect(assigns(:registered_application)).to eq(registered_application)
    end
    
    it "renders the :show template" do
      get :show, id: registered_application
      expect(response).to render_template :show
    end
  end
  
  describe "GET #new" do
    it "assigns a new application to @registered_application" do
      get :new
      expect(assigns(:registered_application)).to be_a_new(RegisteredApplication)
    end
      
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
    
  describe "POST #create" do
    before do
      @user = create(:user)
      session[:user_id] = @user.id
    end
    
    context "with valid attributes" do
      it "saves the new application in the database" do
        expect{ post :create, registered_application: attributes_for(:registered_application) }.to change(RegisteredApplication, :count).by(1)
      end
      
      it "redirects to registered_applications#show" do
        post :create, registered_application: attributes_for(:registered_application)
        expect(response).to redirect_to registered_application_path(assigns[:registered_application])
      end
    end
  
    
    context "without valid attributes" do
      it "does not save the application in the database" do
        expect{ post :create, registered_application: attributes_for(:invalid_registered_application) }.to_not change(RegisteredApplication, :count)
      end
         
      it "re-renders the :new template" do
        post :create, registered_application: attributes_for(:invalid_registered_application)
        expect(response).to render_template :new
      end
    end
  end
 
  
  describe "GET #edit" do
    context "with a valid registered_application" do
      let(:registered_application) { create(:registered_application) }
      
      it "assigns the requested application to @registered_application" do
        get :edit, id: registered_application
        expect(assigns(:registered_application)).to eq registered_application
      end
     it "renders the :edit template" do
       get :edit, id: registered_application
       expect(response).to render_template :edit
     end
   end
  end
  
  describe "PATCH #update" do
    before :each do
      @registered_application = create(:registered_application)
    end
    
    context "with valid attributes" do
      let(:valid_attributes) { attributes_for(:registered_application, name: 'click') }
      
      it "locates the requested application" do
        patch :update, id: @registered_application, registered_application: valid_attributes
        expect(assigns(:registered_application)).to eq(@registered_application)
      end
      
      it "updates the application in the database" do
        patch :update, id: @registered_application, registered_application: valid_attributes
        @registered_application.reload
        expect(@registered_application.name).to eq('click')
      end
      
      it "redirects to registered_application#show" do
        patch :update, id: @registered_application, registered_application: valid_attributes
        expect(response).to redirect_to registered_application_path(@registered_application)
      end
    end
    
    context "without valid attributes" do
      let(:invalid_attributes) { attributes_for(:invalid_registered_application) }
      
      it "does not update the application in the database" do
        patch :update, id: @registered_application, registered_application: invalid_attributes
        expect(@registered_application.name).to_not be_nil
      end
      
      it "re-renders the :edit template" do
        patch :update, id: @registered_application, registered_application: invalid_attributes
        expect(response).to render_template :edit
      end
    end
  end
  
  describe "DELETE #destroy" do
    before :each do
      @registered_application = create(:registered_application)
    end
    
    it "deletes the registered_application from the database" do
      expect{ delete :destroy, id: @registered_application }.to change(RegisteredApplication, :count).by(-1)
    end
    
    it "redirects to registered_application#index" do
      delete :destroy, id: @registered_application
      expect(response).to redirect_to registered_applications_path
    end
  end
      


end
