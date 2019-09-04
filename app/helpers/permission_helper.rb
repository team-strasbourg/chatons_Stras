module PermissionHelper
  def is_admin?
    user_signed_in? && current_user.admin == true
  end
end
