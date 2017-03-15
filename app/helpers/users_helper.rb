module UsersHelper

  def admin_role?
    current_user.admin?
  end

end
