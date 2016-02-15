require 'rails_helper'

describe UsersController do
    
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
    
    describe 'POST #update' do
        context "with valid attributes" do
            before :each do
                @user = create(:user, name: 'Timothy')
            end
            
            it "locates the requested user" do
                post :update, id: @user
                expect(assigns(:user)).to eq(@user)
            end
                
            it "updates the user in the databse" do
                post :update, id: @user, user: attributes_for(:user)
                
            end
            
            it "redirects to root_url" do
            end
        end
            
        context "with invalid attributes" do
            it "does not update the user" do
                post :update
            end
            
            it "renders :edit" do
            end
        end
    end
    
    describe 'DELETE #destroy' do
        # before do
        #     @user = create(:user)
        # end
         
        
        it "deletes the user from the database" do
            create(:user)
            expect { delete :destroy, id: @user.id}.to change(User, :count).by(-1)
        end
        
        it "redirects to root_url" do
            create(:user)
            sesion_id = :user.id
            delete :destroy
            expect(response).to redirect_to root_url
        end
    end
    
end