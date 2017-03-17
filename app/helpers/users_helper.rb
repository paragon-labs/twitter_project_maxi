module UsersHelper

  def admin_role?
    current_user.admin?
  end

  def format_email(user)
    user.email.slice(/[^@]+/)
  end

end
