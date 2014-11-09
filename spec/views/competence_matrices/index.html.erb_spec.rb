require 'rails_helper'

RSpec.describe "competence_matrices/index", :type => :view do
  before(:each) do
    assign(:competence_matrices, [
      CompetenceMatrix.create!(
        :name => "Name"
      ),
      CompetenceMatrix.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of competence_matrices" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
