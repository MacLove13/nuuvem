require 'rails_helper'

RSpec.describe Report, type: :model do
  subject { described_class.new }

  it 'is invalid with valid attributes but without an valid user' do
    subject.purchase_count = 5
    subject.total_price = 23.5
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(email: 'test@gmail.com', password: 12345678)

    subject.user_id = user.id
    subject.purchase_count = 5
    subject.total_price = 23.5
    expect(subject).to be_valid
  end
end
