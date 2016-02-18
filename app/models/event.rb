class Event < ActiveRecord::Base
  belongs_to :registered_application
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :registered_application
end
