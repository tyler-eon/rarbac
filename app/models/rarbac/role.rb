module Rarbac
  # Represents a role. Roles are linked to actions by way of the Permission
  # model.
  class Role < ActiveRecord::Base
    has_many :permissions
  end
end
