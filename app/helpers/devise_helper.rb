module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    return resource.errors.full_messages
  end
end