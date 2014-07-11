module Rarbac
  # Represents an action. Actions are linked to roles by way of the Permission
  # model.
  class Action < ActiveRecord::Base
    has_many :permissions
  end
end
