module ApplicationHelper
  def body_controller_action_class
    [controller.class.name.underscore.parameterize.dasherize, "action-#{action_name}"].join(' ')
  end
end
