require 'rails_helper'

RSpec.describe "competence_matrices/index", :type => :view do
  before(:each) do
    assign(:competence_matrices, [
      FactoryGirl.create(:competence_matrix),
      FactoryGirl.create(:another_competence_matrix)
    ])
  end

  it "renders a list of competence_matrices" do
    render
    assert_select "tr>td", :text => FactoryGirl.build(:competence_matrix).name.to_s, :count => 1
    assert_select "tr>td", :text => FactoryGirl.build(:another_competence_matrix).name.to_s, :count => 1
  end
end
