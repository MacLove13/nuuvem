require 'rails_helper'

RSpec.describe Report::Item, type: :model do
  subject { described_class.new }

  it 'is invalid with valid attributes but without an valid report' do
    subject.purchaser_name = 'Michael'
    subject.item_description = 'Nice'
    subject.item_price = 21.5
    subject.purchase_count = 6
    subject.merchant_address = '495 East Way'
    subject.merchant_name = 'Hector'
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(email: 'test@gmail.com', password: 12345678)
    report = Report.create(user_id: user.id)
    
    subject.report_id = report.id
    subject.purchaser_name = 'Michael'
    subject.item_description = 'Nice'
    subject.item_price = 21.5
    subject.purchase_count = 6
    subject.merchant_address = '495 East Way'
    subject.merchant_name = 'Hector'
    expect(subject).to be_valid
  end
end
