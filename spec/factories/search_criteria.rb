FactoryGirl.define do
  factory :search_criterium, :class => 'SearchCriteria' do
    name "MyString"
scope 1
composition "MyText"
  end

end
