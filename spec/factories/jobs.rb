# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    hierarchy_level nil
    name_string "MyString"
  end
end
