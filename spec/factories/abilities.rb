FactoryGirl.define do
  factory :ability do
    name "an ability"
    competence_matrix
  end

  factory :another_ability, class: Ability do
    name "another ability"
    competence_matrix
  end
end
