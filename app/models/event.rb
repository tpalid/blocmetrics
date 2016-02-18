class Event < ActiveRecord::Base
  belongs_to :registered_application
  belongs_to :user
end
