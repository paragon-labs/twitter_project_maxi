module UsersHelper

  def admin_role?(user = current_user)
    user.admin?
  end

  def format_email(user)
    user.email.slice(/[^@]+/)
  end

end
