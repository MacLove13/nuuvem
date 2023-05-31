require 'rails_helper'

RSpec.describe "Uploads", type: :request do
  context "when user uploads a file" do
    it "must add a report to the database" do
      difference = 1
      user = create(:user)
      initial_count = Report.count

      login_as user
      visit upload_new_path

      page.attach_file('upload_1', Rails.root + 'spec/files/example_input.tab')
      find("#upload").click

      final_count = Report.count

      expect(final_count - initial_count).to eq(difference)
    end

    it "must add a report and be related to the user" do
      difference = 1
      user = create(:user)

      login_as user
      visit upload_new_path

      page.attach_file('upload_1', Rails.root + 'spec/files/example_input.tab')
      find("#upload").click

      expect(Report.last.user_id).to eq(user.id)
    end
  end
end
