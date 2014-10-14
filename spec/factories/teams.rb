# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    projects nil
    name "MyString"
    sector nil
  end
end
