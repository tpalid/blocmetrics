require 'rails_helper'

describe User do
    it "is valid with a name, email, and password" do
        user = User.new(name: 'Rob', email: 'a@b.c', password: 'password')
        expect(user).to be_valid
    end
    
    it "is invalid without a name" do
        user = User.new(name: nil, email: 'a@b.c', password: 'password')
        expect(user).to_not be_valid        
    end
    
    it "is invalid without an email" do
        user = User.new(name: 'Joe', email: nil, password: 'password')
        expect(user).to_not be_valid
    end
    
    it "is invalid without a password" do
        user = User.new(name: 'Joe', email: 'a@b.c', password: nil)
        expect(user).to_not be_valid
    end
    
    it "is invalid if the email is already in use" do
        create(:user, email: 'example@email.com')
        user = User.new(email: 'example@email.com')
        expect(user).to_not be_valid
    end
    
end