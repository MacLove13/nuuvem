class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = user_reports
    @reports_to_list = user_reports.page(params[:page]).per(5)
  end

  private

  def user_reports
    @user_reports ||= Report.where(user_id: current_user.id)
  end
end
