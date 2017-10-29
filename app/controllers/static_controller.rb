class StaticController < ApplicationController
  def home
    if current_user.type == "AdminUser"
      @pending_approvals = Post.where(status: 'submitted')
      @recent_audit_items = AuditLog.last(10)
    else

    end
  end
end
