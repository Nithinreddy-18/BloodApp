
FactoryGirl.define do
  factory(:user) do
    sequence(:email) {|i| "joe#{i}@effone.com" }
    sequence(:name) {|i| "Joe #{i}"}
    phone '123123123'
    blood_group 'o+'
    address 'Test'
    password "password"
  end
end

