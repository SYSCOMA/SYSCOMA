FactoryGirl.define do
  factory :competence_matrix do
    name "A Matrix"
  end

  factory :another_competence_matrix, class: CompetenceMatrix do
    name "The Matrix"
  end

  factory :invalid_competence_matrix, class: CompetenceMatrix do
    name ""
  end
end
