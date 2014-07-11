module Rarbac
  # Defines application helpers, useful in controllers to add RBAC filters.
  module ApplicationHelper
    # Ensure that `current_user` has at least one of the given roles. If no
    # block is given, a failed check will render a header-only response with
    # status code 403 (Forbidden).
    #
    # @param [Array<String>] args an argument list of roles.
    # @param [Proc] block if given, invoked with a single parameter, which is
    #   the result of the role check.
    def ensure_role!(*args, &block)
      has_something?(:has_role?, args, block)
    end

    # Ensure that `current_user` has all of the given roles. If no block is
    # given, a failed check will render a header-only response with status code
    # 403 (Forbidden).
    #
    # @param [Array<String>] args an argument list of roles.
    # @param [Proc] block if given, invoked with a single parameter, which is
    #   the result of the role check.
    def ensure_roles!(*args, &block)
      has_something?(:has_roles?, args, block)
    end

    # Ensure that `current_user` has permission to a given action. If no action
    # name is supplied, this will instead use the currently-executing controller
    # and action names. If no block is given, a failed check will render a
    # header-only response with status code 403 (Forbidden).
    #
    # @param [String] action name of the action to check permissions for.
    # @param [Proc] block if given, invoked with a single parameter, which is
    #   the result of the role check.
    def ensure_permission!(action=nil, &block)
      unless action
        klass = self.class.name.underscore.sub("_controller", "")
        action = "#{klass}##{action_name}"
      end

      # If the action doesn't exist, don't worry about the current_user
      if Action.where(name: action).count == 0
        maybe_render(true, block)
      else
        has_something?(:has_permission?, action, block)
      end
    end

    private

    def has_something?(method, args, block)
      maybe_render(current_user.send(method, args), block)
    end

    def maybe_render(success, block)
      if block
        block.call(success)
      elsif !success
        head status: 403
      end
    end
  end
end
