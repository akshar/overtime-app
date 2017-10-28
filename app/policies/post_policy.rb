class PostPolicy < ApplicationPolicy
  def update?
    return true if !post_approved? && admin_or_user
    return true if admin? && post_approved?

  end

  def approve?
    admin?
  end

  private

  def admin_or_user
    record.user_id == user.id || admin?
  end

  def admin?
    user.type =='AdminUser'
  end

  def post_approved?
    record.approved?
  end
end
