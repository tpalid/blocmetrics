require 'rails_helper'

describe UsersController do
    
    describe 'GET #new' do
        it "assigns a new User to @user" do
            get :new
            expect(assigns(:user)).to be_a_new(User)
        end
        
        it "renders the :new template" do
            get :new
            expect(response).to render_template :new
        end
    end
    
    describe 'POST #create' do
        context "with valid attributes" do
            it "saves the new user in the database" do
                expect{ post :create, user: attributes_for(:user) }.to change(User, :count).by(1)
            end
            
            it "redirects to root_path" do
                post :create, user: attributes_for(:user)
                expect(response).to redirect_to root_url
            end
        end
        
        context "without valid attributes" do
            it "does not save the new user to the database" do
                expect{ post :create, user: attributes_for(:invalid_user) }.to_not change(User, :count)
            end
            
            it "renders :new" do
                post :create, user: attributes_for(:invalid_user)
                expect(response).to render_template :new
            end
        end
    end
    
    describe 'GET #edit' do 
        let(:user) { create(:user) }
        
        it 'assigns the requested user to @user' do
            get :edit, id: user
            expect(assigns(:user)).to eq user
        end
    end
            
    
    describe 'PATCH #update' do
        before :each do
            @user = create(:user)
        end
        
        context "with valid attributes" do
            let(:valid_attributes) { attributes_for(:user, name: 'Tim') }
            
            it "locates the requested user" do
                patch :update, {id: @user, user: valid_attributes}
                expect(assigns(:user)).to eq(@user)
            end
                
            it "updates the user in the databse" do
                patch :update, id: @user, user: valid_attributes
                @user.reload
                expect(@user.name).to eq('Tim')
            end
            
            it "redirects to root_url" do
                 patch :update, id: @user, user: valid_attributes
                 expect(response).to redirect_to(root_url)
            end
        end
            
        context "with invalid attributes" do
            let(:invalid_attributes) { attributes_for(:invalid_user) }
            
            it "does not update the user" do
                patch :update, id: @user, user: attributes_for(:invalid_user)
                expect(@user.name).to_not be_nil
            end
            
            it "renders :edit" do
                patch :update, id: @user, user: attributes_for(:invalid_user)
                expect(response).to render_template :edit
            end
        end
    end
    
    describe 'DELETE #destroy' do
        before :each do
            @user = create(:user)
        end
    
        it "deletes the user from the database" do
            expect{ delete :destroy, id: @user}.to change(User, :count).by(-1)
        end
        
        it "redirects to root_url" do
            delete :destroy, id: @user
            expect(response).to redirect_to root_url
        end
    end
    
end