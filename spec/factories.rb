FactoryGirl.define do

  factory :user do
    name 'Arnold Schwarzenegger'
    email 'arnie@pump-it-up.com'
    password 'foobar'
  end

  factory :account do
    name 'Test Account'
    number '1234567890'
    ofx_type 'BankAccount'
  end

end
