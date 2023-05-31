require 'rails_helper'

RSpec.describe "Dashboards", type: :controller do
  describe "GET dashboard#index" do
    context "when the user is logged" do
      it "should list all reports" do
        user = create(:user)
        reports = create_list(:report, 10, user_id: user.id)

        login_as user
        visit dashboard_path

        reports.each do |report|
          expect(page).to have_content("Report_#{report.created_at.to_s.gsub(' UTC', '')}")
        end
      end

      it "should display gross income for all time" do
        user = create(:user)
        reports = create_list(:report, 10, user_id: user.id)

        login_as user
        visit dashboard_path

        total_price = 0
        reports.each do |report|
          total_price += report.total_price
        end

        section = find(:css, '#all-time-gross-income')
        expect(section).to have_text(total_price)
      end

      it "should display the quantity of all items purchased at all times" do
        user = create(:user)
        reports = create_list(:report, 10, user_id: user.id)

        login_as user
        visit dashboard_path

        purchase_count = 0
        reports.each do |report|
          purchase_count += report.purchase_count
        end

        section = find(:css, '#all-time-purchased-items')
        expect(section).to have_text(purchase_count)
      end

      it "should display total user reports" do
        user = create(:user)
        reports = create_list(:report, 15, user_id: user.id)

        login_as user
        visit dashboard_path

        section = find(:css, '#reports-count')
        expect(section).to have_text(15)
      end
    end
  end
end
