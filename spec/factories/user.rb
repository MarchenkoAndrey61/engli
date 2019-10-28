FactoryGirl.define do
  factory :user do
    username "username"
    sequence(:email) { |i| "email#{i}@mail.ru"}
    encrypted_password" "encrypted_password""
  end
end