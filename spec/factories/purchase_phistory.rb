FactoryBot.define do
  factory :purchase_phistory do
    postal_code      { '111-1111'}
    prefecture_id    {Faker::Number.between(from:2, to: 48)}
    city             { '長野県' }
    house_number     { '3-4-7'}
    build_number     { '平和マンション' }
    phone_number     { '09000000000'}
    token            { "tok_abcdefghijk00000000000000000" }
  end
end
