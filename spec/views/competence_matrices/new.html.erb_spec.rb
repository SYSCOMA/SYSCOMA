require 'rails_helper'

RSpec.describe "competence_matrices/new", :type => :view do
  before(:each) do
    assign(:competence_matrix, FactoryGirl.build(:competence_matrix))
  end

  it "renders new competence_matrix form" do
    render
    assert_select "form[action=?][method=?]", competence_matrices_path, "post" do
      assert_select "input#competence_matrix_name[name=?]", "competence_matrix[name]"
    end
  end
end
