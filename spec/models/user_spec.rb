require 'rails_helper'

describe User do
    it "is valid with a name, email, and password" do
        expect(build(:user)).to be_valid
    end
    
    it "is invalid without a name" do
        expect(build(:user, name: nil)).to_not be_valid        
    end
    
    it "is invalid without an email" do
        expect(build(:user, email: nil)).to_not be_valid
    end
    
    it "is invalid without a password" do
        expect(build(:user, password: nil)).to_not be_valid
    end
    
    it "is invalid if the email is already in use" do
        create(:user, email: 'example@email.com')
        user = (build(:user, email: 'example@email.com'))
        expect(user).to_not be_valid
    end
    
    describe ".authenticate" do
        let(:user) { create(:user) }
        
            it "returns user, if given the correct credentials of an existing user" do
                expect(User.authenticate(user.email, user.password)).to eq(user)
            end
            
            it "returns nil, if given invalid credentials" do
                expect(User.authenticate('notanemail@example.com', 'abcdefg')).to eq(nil)
            end
    end
    
    describe "#encrypt_password" do
        
        context "a password is given" do
            let (:user) { create(:user) }
            
            it "returns a password_salt" do
                expect(user.password_salt).to_not be_nil
            end
            
            it "returns a password_hash" do
                expect(user.password_hash).to_not be_nil
            end
        end
    end
    
end


