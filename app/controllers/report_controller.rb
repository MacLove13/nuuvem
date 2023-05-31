class ReportController < ApplicationController
  before_action :authenticate_user!

  def show
    @report = Report.find_by(id: params[:id], user_id: current_user.id)
    @items = Report::Item.where(report_id: @report.id)
  end
end
