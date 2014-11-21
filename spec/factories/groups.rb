FactoryGirl.define do
  factory :group, aliases: [:subgroup_of] do
    name "A commom group"
    subgroup_of nil
    manager
  end

  factory :subgroup, class: Group do
    name "A commom subgroup"
    subgroup_of
    manager
  end
end
