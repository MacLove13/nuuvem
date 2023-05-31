FactoryBot.define do
  factory :report do
    user_id { build(:user).id }
    purchase_count { 5 }
    total_price { "27.5" }
  end
end
