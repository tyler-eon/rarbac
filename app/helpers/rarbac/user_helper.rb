module Rarbac
  # A collection of useful functions to be used by the user model.
  #
  #     include Rarbac::UserHelper
  #
  # That's it! Now you have access to some awesome RBAC helper functions.
  module UserHelper
    # Determines if the user has one or more of the given roles linked to it.
    #
    # @param [String] args an argument list of one or more roles to check for.
    # @return [true|false] true if the user is linked to at least one of the
    #   given roles.
    def has_role?(*args)
      throw Exception.new("Must supply at least one role.") if args.empty?
      roles.where(name: args).count > 0
    end

    # Determines if the user has all of the given roles linked to it.
    #
    # @param [String] args an argument list of one or more roles to check for.
    # @return [true|false] true if the user is linked to all of the given roles.
    def has_roles?(*args)
      throw Exception.new("Must supply at least one role.") if args.empty?
      roles.where(name: args).count == args.count
    end

    # Determines if the user has permission to a given action. If the action
    # does not exist at all, it is assumed the action is publicly available.
    #
    # @param [String] action name of the action to check permission for.
    # @return [true|false] true if the user has at least one role linked to it
    #   with permission to the given action.
    def has_permission?(action)
      return true if Action.where(name: action).count == 0
      actions.where(name: action).count > 0
    end
  end
end
