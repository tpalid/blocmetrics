require "rails_helper"

describe SessionsController do
  
   describe '#create' do
      context "a user with valid credentials" do
         let(:user) { create(:user) }
         
         # it "responds with success" do
         #    post(:create, { email: user.email , password: user.password })
         #    expect(response).to be_success
         # end
         
         it "creates a session for the user" do
            post(:create, { email: user.email , password: user.password })
            expect(session[:user_id]).to eq(user.id)
         end
         
         it "redirects to the root" do
            post(:create, { email: user.email , password: user.password })
            assert_redirected_to root_url
         end
      end
      
      context "no user, or a user without valid credentials" do
         let(:user) { nil }
         
         # it "responds with success" do
         #    post :create
         #    expect(response).to be_success
         # end
       
         it "renders a new template" do
            post :create
            expect(response).to render_template(:new)
         end
      end
   end
   
   describe '#destroy' do
      
      context 'a valid user' do
         let(:user) { create(:user) }
         before do
            post(:create, { email: user.email , password: user.password })
         end
         
         # it "responds with success" do
         #    get :destroy
         #    expect(response).to be_success
         # end
       
         it "deletes the session" do
            get :destroy
            expect(session[:user_id]).to be_nil
         end
         
         it "redirects to root_url" do
            get :destroy
            expect(response).to redirect_to(root_url)
         end
      end
   end
            
         
end
           
      # context ""   
               