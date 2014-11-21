FactoryGirl.define do
  factory :manager, class: User do
    email "manager@company.com"
    name "Foo Bar"
    password "12345asd"
    password_confirmation "12345asd"
    admin false
  end

  factory :employee, class: User do
    email "employee@company.com"
    name "John Doe"
    password "12345asd"
    password_confirmation "12345asd"
    admin false
  end

  factory :admin, class: User do
    email "admin@company.com"
    name "administrator of the system"
    password "12345asd"
    password_confirmation "12345asd"
    admin true
  end
end
