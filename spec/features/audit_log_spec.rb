require 'rails_helper'

describe "AuditLog features" do
  let (:aduit_log ){ FactoryGirl.create(:aduit_log) }

  describe 'index' do
    it "has an index page that can be reached" do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it "cannot be accessed by non admin users" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end

  end
end
