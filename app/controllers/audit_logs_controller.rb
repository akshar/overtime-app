class AuditLogsController < ApplicationController
  def index
    @audit_log = AuditLog.page(params[:page]).per(10)
    authorize @audit_log
  end

end
