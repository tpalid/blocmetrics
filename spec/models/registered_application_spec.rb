require 'rails_helper'

describe RegisteredApplication do
    it "is valid with a name, url, and user" do
        expect(build(:registered_application)).to be_valid
    end
    
    it "is invalid without a name" do
        expect(build(:registered_application, name: nil)).to_not be_valid
    end
    
    it "is invalid without a url" do
        expect(build(:registered_application, url: nil)).to_not be_valid
    end
    
    it "is invalid without a user" do
        expect(build(:registered_application, user: nil)).to_not be_valid
    end

end
    


