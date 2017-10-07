class AuditLogsController < ApplicationController
  def index
    @audit_log = AuditLog.all
    authorize @audit_log
  end

end
