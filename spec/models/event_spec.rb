require 'rails_helper'

RSpec.describe Event do
  it "is valid with a name and application" do
      expect(build(:event)).to be_valid
  end
  
  it "is invalid without a name" do
      expect(build(:event, name: nil)).to_not be_valid
  end
  
  it "is invalid without an application" do
      expect(build(:event, registered_application: nil)).to_not be_valid
  end
end
